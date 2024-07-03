import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/models/mapper/appointment_mapper.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/appointment/data/data_source/appointment_data_source.dart';
import 'package:flipflow_app/features/appointment/data/mapper/billing_data_mapper.dart';
import 'package:flipflow_app/features/appointment/data/models/appointment_request.dart';
import 'package:flipflow_app/features/appointment/domain/entities/user_billing_data_entity.dart';
import 'package:flipflow_app/features/appointment/domain/repo/appointment_repo.dart';

class AppointmentRepoImpl extends AppointmentRepository {
  final AppointmentDataSource _appointmentDataSource;
  final NetworkInfo _networkInfo;

  AppointmentRepoImpl(this._appointmentDataSource, this._networkInfo);

  @override
  Future<Either<Failure, AppointmentEntity>> createAppointment(
      AppointmentRequest appointment) async {
    try {
      if (await _networkInfo.isConnected) {
        final result =
            await _appointmentDataSource.createAppointment(appointment);
        return Right(result.toEntity());
      } else {
        return Left(Failure.connectionFailure());
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message.orEmpty()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createPaymentKey(
      UserBillingDataEntity billingDataEntity) async {
    try {
      if (await _networkInfo.isConnected) {
        final paymentKey = await _appointmentDataSource
            .createPaymentKey(billingDataEntity.toModel());
        return Right(paymentKey);
      } else {
        return Left(Failure.connectionFailure());
      }
    } on Failure catch (failure) {
      return Left(failure);
    } on DioException catch (e) {
      return Left(Failure(message: e.message.orEmpty()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAppointmentPaymentStatus(
      String appointmentId) async {
    try {
      if (await _networkInfo.isConnected) {
        await _appointmentDataSource.setPaymentStatus(appointmentId);
        return const Right(null);
      } else {
        return Left(Failure.connectionFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment(String appointmentId) async {
    try {
      if (await _networkInfo.isConnected) {
        await _appointmentDataSource.cancelAppointment(appointmentId);
        return const Right(null);
      } else {
        return Left(Failure.connectionFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
