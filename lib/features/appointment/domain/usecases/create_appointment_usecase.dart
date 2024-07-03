import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/models/appointment/trainee_model.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/appointment/data/models/appointment_request.dart';
import 'package:flipflow_app/features/appointment/domain/repo/appointment_repo.dart';

class CreateAppointmentUseCase
    extends BaseUseCase<AppointmentRequest, AppointmentEntity> {
  final AppointmentRepository _appointmentRepository;

  CreateAppointmentUseCase(this._appointmentRepository);

  @override
  Future<Either<Failure, AppointmentEntity>> execute(
      AppointmentRequest input) async {
    return await _appointmentRepository.createAppointment(input);
  }
}

class CreateAppointmentUseCaseInput extends AppointmentRequest {
  final String traineeName;
  final String traineeEmail;
  final int traineeAge;
  final String traineePhoneNumber;
  final String traineeImageUrl;
  final File? image;
  CreateAppointmentUseCaseInput({
    required this.traineeName,
    required this.traineeEmail,
    required this.traineePhoneNumber,
    required this.traineeAge,
    required this.image,
    required this.traineeImageUrl,
    required super.gymnasticTypeId,
    required super.coachId,
    required super.userId,
    required super.centerId,
    required super.trainingTime,
  }) : super(
            appointmentId: '',
            trainee: TraineeModel(
                name: traineeName,
                email: traineeEmail,
                imageUrl: traineeImageUrl,
                image: image,
                uid: '',
                phoneNumber: traineePhoneNumber,
                age: traineeAge),
            createdAt: DateTime.now(),
            paymentStatus: "Pending");
}
