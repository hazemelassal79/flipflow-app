import 'package:flipflow_app/core/models/workout/workout_model.dart';
import 'package:flipflow_app/features/workouts/data/models/exercise_model.dart';
import 'package:flipflow_app/features/workouts/data/models/filter_wotkouts_option.dart';
import 'package:flipflow_app/features/workouts/data/models/update_user_workout_model.dart';

abstract class WorkoutDataSource {
  Future<List<WorkoutModel>> getWorkouts(FilterWorkoutsOption filter);

  Future<List<ExerciseModel>> getExercisesUsingUid(List<String> exercisesUids);

  Future<void> updateUserWorkout(
      UpdateUserWorkoutRequest updateUserWorkoutRequest);
}
