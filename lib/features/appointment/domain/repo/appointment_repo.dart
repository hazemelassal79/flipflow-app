import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/appointment/data/models/appointment_request.dart';
import 'package:flipflow_app/features/appointment/domain/entities/user_billing_data_entity.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, AppointmentEntity>> createAppointment(
      AppointmentRequest appointment);

  Future<Either<Failure, String>> createPaymentKey(
      UserBillingDataEntity billingDataEntity);

  Future<Either<Failure, void>> setAppointmentPaymentStatus(
      String appointmentId);

  Future<Either<Failure, void>> cancelAppointment(String appointmentId);
}
