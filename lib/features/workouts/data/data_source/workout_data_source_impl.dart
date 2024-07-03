
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipflow_app/core/models/workout/workout_model.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/workouts/data/data_source/workouts_data_source.dart';
import 'package:flipflow_app/features/workouts/data/models/exercise_model.dart';
import 'package:flipflow_app/features/workouts/data/models/filter_wotkouts_option.dart';
import 'package:flipflow_app/features/workouts/data/models/update_user_workout_model.dart';

class WorkoutDataSourceImpl extends WorkoutDataSource {
  final FirebaseFirestore _firestore;

  WorkoutDataSourceImpl(this._firestore);

  @override
  Future<List<WorkoutModel>> getWorkouts(FilterWorkoutsOption filter) async {
    var workouts =
        (await _firestore.collection(FirebaseConstants.workoutCollectionPath)
            .get()).docs;
    if (filter.isLessThan10Min && filter.isLessThan3Exersises) {
      workouts = workouts.where((element) => (element['minutes'] <= 10 &&
          element['numberOfExercises'] <= 3)).toList();
    } else if (filter.isLessThan10Min) {
      workouts = workouts.where((element) => (element['minutes'] <= 10)).toList();
    } else if (filter.isLessThan3Exersises) {
      workouts = workouts.where((element) => (element['numberOfExercises'] <= 3)).toList();
    }

    final data = workouts
        .map((doc) => WorkoutModel.fromJson(doc.data()))
        .toList();

    if (filter.query.isNotEmpty) {
      return data
          .where((element) =>
      (element.name
          ?.toLowerCase()
          .contains(filter.query.toLowerCase())) ??
          false)
          .toList();
    }
    return data;
  }

  @override
  Future<List<ExerciseModel>> getExercisesUsingUid(
      List<String> exercisesUids) async {
    final exercises = await _firestore
        .collection(FirebaseConstants.exerciseCollectionPath)
        .where(FieldPath.documentId, whereIn: exercisesUids)
        .get();

    return exercises.docs
        .map((doc) => ExerciseModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<void> updateUserWorkout(
      UpdateUserWorkoutRequest updateUserWorkoutRequest) async {
    final doc = FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollectionPath)
        .doc(updateUserWorkoutRequest.userId);
    final data = await doc.get();
    final doneWorkouts = data['workouts'] as Map? ?? {};
    final exercisesOfAWorkout =
    doneWorkouts[updateUserWorkoutRequest.workoutId] as List?;

    if (exercisesOfAWorkout == null) {
      doneWorkouts[updateUserWorkoutRequest.workoutId] = [
        updateUserWorkoutRequest.exerciseId
      ];
    } else {
      final isExists =
      exercisesOfAWorkout.contains(updateUserWorkoutRequest.exerciseId);

      ///Checks If Exercise Is Already Exists
      if (isExists) {
        return;
      }

      exercisesOfAWorkout.add(updateUserWorkoutRequest.exerciseId);
      doneWorkouts[updateUserWorkoutRequest.workoutId] = exercisesOfAWorkout;
    }
    var progress = data['progress'];

    ///Checks If Workout Is Done To Update User Progress
    if (updateUserWorkoutRequest.isWorkoutDone) {
      final workouts = await _firestore
          .collection(FirebaseConstants.workoutCollectionPath)
          .get();
      progress =
          ((doneWorkouts.keys.length / workouts.docs.length) * 100).toInt();
    }

    await doc.update({
      'workouts': doneWorkouts,
      'score': data['score'] + 1,
      'progress': progress
    });
  }
}
