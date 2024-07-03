import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<WorkoutEntity>>> getNewWorkouts();

  Future<Either<Failure, UserEntity>> getUserData();

  Future<Either<Failure, List<AppointmentEntity>>> getUserAppointments();
}
