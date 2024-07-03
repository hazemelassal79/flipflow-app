import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/models/workout/workout_model.dart';

abstract class HomeDataSource {
  Future<UserModel> getUserData();

  Future<List<WorkoutModel>> getNewWorkouts();

  Future<List<AppointmentModel>> getUserAppointments();
}
