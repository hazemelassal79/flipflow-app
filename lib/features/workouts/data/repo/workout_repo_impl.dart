// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/models/mapper/workout_mapper.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/workouts/data/data_source/workouts_data_source.dart';
import 'package:flipflow_app/features/workouts/data/mapper/exercise_mapper.dart';
import 'package:flipflow_app/features/workouts/data/mapper/filter_mapper.dart';
import 'package:flipflow_app/features/workouts/data/mapper/update_workout_mapper.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flipflow_app/features/workouts/domain/entities/filter_workout_entity.dart';
import 'package:flipflow_app/features/workouts/domain/entities/update_user_workout_entity.dart';
import 'package:flipflow_app/features/workouts/domain/repo/workout_repo.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  final WorkoutDataSource _workoutDataSource;
  final NetworkInfo _networkInfo;

  WorkoutRepositoryImpl(this._workoutDataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercisesUsingUid(
      List<String> exercisesUids) async {
    try {
      if (await _networkInfo.isConnected) {
        final data =
            await _workoutDataSource.getExercisesUsingUid(exercisesUids);
        return Right(data.map((e) => e.toExerciseEnity()).toList());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts(
    FilterWorkoutsOptionEntity filter,
  ) async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _workoutDataSource.getWorkouts(filter.toEntity());
        return Right(data.map((e) => e.toWorkoutEntity()).toList());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserWorkout(
      UpdateUserWorkoutEntity updateUserWorkoutEntity) async {
    try {
      if (await _networkInfo.isConnected) {
        await _workoutDataSource.updateUserWorkout(
            updateUserWorkoutEntity.toUpdateUserWorkoutRequest());
        return const Right(0);
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }
}
