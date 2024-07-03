part of 'workouts_cubit.dart';

sealed class WorkoutsState extends Equatable {
  const WorkoutsState();

  @override
  List<Object> get props => [];
}

final class WorkoutsInitial extends WorkoutsState {}

class GetWorkoutsLoadingState extends WorkoutsState {}

class GetWorkoutsSuccessState extends WorkoutsState {}

class GetWorkoutsErrorState extends WorkoutsState {
  final String message;
  const GetWorkoutsErrorState(this.message);
}

class GetExercisesLoadingState extends WorkoutsState {}

class GetExercisesSuccessState extends WorkoutsState {}

class GetExercisesErrorState extends WorkoutsState {
  final String message;
  const GetExercisesErrorState(this.message);
}
class ChangeFilterState extends WorkoutsState {}

class ApplyFilterState extends WorkoutsState {}