part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class ChangeStepperState extends AppointmentState {}

final class ChangeTraineeAgeState extends AppointmentState {}

final class ChangeSelectedTimeIndexState extends AppointmentState {}

final class SetTrainingDateState extends AppointmentState {}

final class CreateAppointmentLoadingState extends AppointmentState {}

final class CreateAppointmentSuccessState extends AppointmentState {}

final class CreateAppointmentErrorState extends AppointmentState {
  final String message;

  CreateAppointmentErrorState(this.message);
}

final class SetIndicatorState extends AppointmentState {}

final class CreatePaymentKeyLoadingState extends AppointmentState {}

final class CreatePaymentKeySuccessState extends AppointmentState {}

final class CreatePaymentKeyErrorState extends AppointmentState {
  final String message;

  CreatePaymentKeyErrorState(this.message);
}

final class SetPaymentStatusLoadingState extends AppointmentState {}

final class SetPaymentStatusSuccessState extends AppointmentState {}

final class SetPaymentStatusErrorState extends AppointmentState {
  final String message;
  SetPaymentStatusErrorState(this.message);
}

final class PickImageState extends AppointmentState {}

final class CancelAppointmentSuccessState extends AppointmentState {}

final class CancelAppointmentLoadingState extends AppointmentState {}

final class CancelAppointmentErrorState extends AppointmentState {
  final String message;
  CancelAppointmentErrorState(this.message);
}
