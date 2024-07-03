import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flipflow_app/features/workouts/domain/entities/filter_workout_entity.dart';
import 'package:flipflow_app/features/workouts/domain/entities/update_user_workout_entity.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts(
    FilterWorkoutsOptionEntity filter,
  );

  Future<Either<Failure, List<ExerciseEntity>>> getExercisesUsingUid(
      List<String> exercisesUids);

  Future<Either<Failure, void>> updateUserWorkout(
      UpdateUserWorkoutEntity updateUserWorkoutEntity);
}
