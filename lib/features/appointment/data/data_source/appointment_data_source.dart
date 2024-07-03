import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/features/appointment/data/models/appointment_request.dart';
import 'package:flipflow_app/features/appointment/data/models/user_billing_data_model.dart';

abstract class AppointmentDataSource {
  Future<String> createPaymentKey(UserBillingDataRequest userBillingDataModel);

  Future<AppointmentModel> createAppointment(
      AppointmentRequest appointmentRequest);

  Future<void> setPaymentStatus(String appointmentId);

  Future<void> cancelAppointment(String appointmentId);
}
