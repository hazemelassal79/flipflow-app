import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/features/coach/data/requests/update_coach_model.dart';

abstract class CoachDataSource {
  Future<CoachModel> getCoachData();

  Future<List<AppointmentModel>> getCoachAppointments();

  Future<CoachModel> updateCoachData(UpdateCoachDataRequest coachDataRequest);
}
