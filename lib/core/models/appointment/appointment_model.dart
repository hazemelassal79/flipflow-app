import 'package:flipflow_app/core/models/appointment/trainee_model.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';

class AppointmentModel {
  final String? appointmentId;
  final String? paymentStatus;
  final DateTime? createdAt;
  final String? trainingTime;
  final TraineeModel? trainee;
  final CenterModel? center;
  final GymnasticTypeModel? gymnasticType;
  final CoachModel? coach;
  AppointmentModel({
    this.appointmentId,
    this.coach,
    this.center,
    this.trainee,
    this.gymnasticType,
    required this.paymentStatus,
    required this.trainingTime,
    required this.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'] as String?,
      trainingTime: json['trainingTime'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      createdAt: DateTime.tryParse(json['createdAt']),
    );
  }

  AppointmentModel copyWith({
    TraineeModel? trainee,
    CoachModel? coach,
    CenterModel? center,
    GymnasticTypeModel? gymnasticType,
  }) {
    return AppointmentModel(
      appointmentId: appointmentId,
      paymentStatus: paymentStatus,
      trainingTime: trainingTime,
      createdAt: createdAt,
      trainee: trainee ?? this.trainee,
      gymnasticType: gymnasticType ?? this.gymnasticType,
      coach: coach ?? this.coach,
      center: center ?? this.center,
    );
  }
}
