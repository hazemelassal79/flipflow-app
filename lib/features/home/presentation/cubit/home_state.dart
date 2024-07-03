part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}

class GetUserDataLoadingState extends HomeState {}

class GetUserDataSuccessState extends HomeState {}

class GetUserDataErrorState extends HomeErrorState {
  GetUserDataErrorState(super.message);
}

class GetNewWorkoutsLoadingState extends HomeState {}

class GetNewWorkoutsSuccessState extends HomeState {}

class GetNewWorkoutsErrorState extends HomeErrorState {
  GetNewWorkoutsErrorState(super.message);
}

class GetUserAppointmentsLoadingState extends HomeState {}

class GetUserAppointmentsSuccessState extends HomeState {}

class GetUserAppointmentsErrorState extends HomeErrorState {
  GetUserAppointmentsErrorState(super.message);
}
