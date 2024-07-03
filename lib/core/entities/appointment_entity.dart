import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/entities/trainee_entity.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';

class AppointmentEntity {
  final String appointmentId;
  final String paymentStatus;
  final DateTime createdAt;
  final String trainingTime;
  final TraineeEntity? trainee;
  final CenterEntity? center;
  final CoachEntity? coach;
  final GymnasticTypeEntity? gymnasticType;
  AppointmentEntity({
    required this.appointmentId,
    this.gymnasticType,
    required this.trainee,
    required this.center,
    required this.coach,
    required this.paymentStatus,
    required this.trainingTime,
    required this.createdAt,
  });
}
