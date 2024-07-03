import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/coach/data/requests/update_coach_model.dart';

abstract class CoachRepository {
  Future<Either<Failure, CoachEntity>> getCoachData();

  Future<Either<Failure, CoachEntity>> updateCoachData(
      UpdateCoachDataRequest updateCoachDataRequest);

  Future<Either<Failure, List<AppointmentEntity>>> getCoachAppointment();
}
