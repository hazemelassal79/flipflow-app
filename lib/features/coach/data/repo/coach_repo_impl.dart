import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/models/mapper/appointment_mapper.dart';
import 'package:flipflow_app/core/models/mapper/coaches_mapper.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/coach/data/data_source/coach_data_source.dart';
import 'package:flipflow_app/features/coach/data/requests/update_coach_model.dart';
import 'package:flipflow_app/features/coach/domain/repo/coach_repo.dart';

class CoachRepositoryImpl implements CoachRepository {
  final CoachDataSource _coachDataSource;
  final NetworkInfo _networkInfo;

  CoachRepositoryImpl(this._coachDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getCoachAppointment() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _coachDataSource.getCoachAppointments();
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

  @override
  Future<Either<Failure, CoachEntity>> getCoachData() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _coachDataSource.getCoachData();
        return Right(result.toCoachEntity());
      } else {
        return Left(Failure.connectionFailure());
      }
    } on Failure catch (failure) {
      return Left(failure);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.orEmpty()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CoachEntity>> updateCoachData(
      UpdateCoachDataRequest updateCoachDataRequest) async {
    try {
      if (await _networkInfo.isConnected) {
        final result =
            await _coachDataSource.updateCoachData(updateCoachDataRequest);
        return Right(result.toCoachEntity());
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
