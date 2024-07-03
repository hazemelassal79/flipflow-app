import 'package:flipflow_app/core/models/appointment/trainee_model.dart';

class AppointmentRequest {
  final String? appointmentId;
  final String? coachId;
  final String? userId;
  final String? centerId;
  final String? gymnasticTypeId;
  final String? paymentStatus;
  final DateTime? createdAt;
  final String? trainingTime;
  final TraineeModel? trainee;

  AppointmentRequest({
    this.appointmentId,
    required this.gymnasticTypeId,
    required this.coachId,
    this.trainee,
    required this.userId,
    required this.centerId,
    required this.paymentStatus,
    required this.trainingTime,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'gymnasticTypeId': gymnasticTypeId,
      'coachId': coachId,
      'userId': userId,
      'centerId': centerId,
      'paymentStatus': paymentStatus,
      'trainingTime': trainingTime,
      'createdAt': createdAt.toString(),
    };
  }
}
