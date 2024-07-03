part of 'coach_cubit.dart';

@immutable
sealed class CoachState {}

final class CoachInitial extends CoachState {}

final class GetCoachDataLoadingState extends CoachState {}

final class GetCoachDataSuccessState extends CoachState {}

final class CoachErrorState extends CoachState {
  final String message;

  CoachErrorState(this.message);
}

final class GetCoachDataErrorState extends CoachErrorState {
  GetCoachDataErrorState(super.message);
}

final class GetAppointmentsLoadingState extends CoachState {}

final class GetAppointmentsSuccessState extends CoachState {}

final class GetAppointmentsErrorState extends CoachErrorState {
  GetAppointmentsErrorState(super.message);
}

final class UpdateCoachDataLoadingState extends CoachState {}

final class UpdateCoachDataSuccessState extends CoachState {}

final class UpdateCoachDataErrorState extends CoachState {
  final String message;

  UpdateCoachDataErrorState(this.message);
}

final class ImagePickedState extends CoachState {}
