import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/models/mapper/appointment_mapper.dart';
import 'package:flipflow_app/core/models/mapper/user_mapper.dart';
import 'package:flipflow_app/core/models/mapper/workout_mapper.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/home/data/data_source/home_data_source.dart';
import 'package:flipflow_app/features/home/domain/repo/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeDataSource _dataSource;

  HomeRepositoryImpl(this._networkInfo, this._dataSource);
  @override
  Future<Either<Failure, List<WorkoutEntity>>> getNewWorkouts() async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _dataSource.getNewWorkouts();
        return Right(data.map((e) => e.toWorkoutEntity()).toList());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message.orEmpty()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _dataSource.getUserData();
        return Right(data.toUserEntity());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message.orEmpty()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getUserAppointments() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _dataSource.getUserAppointments();
        return Right(result.map((e) => e.toEntity()).toList());
      } else {
        return Left(Failure.connectionFailure());
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.orEmpty()));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
