part of 'exercise_details_cubit.dart';

sealed class ExerciseDetailsState {
  const ExerciseDetailsState();
}

final class ExerciseDetailsInitial extends ExerciseDetailsState {}

final class LoadVideoLoadingState extends ExerciseDetailsState {}

final class LoadVideoSuccessState extends ExerciseDetailsState {}

final class LoadVideoErrorState extends ExerciseDetailsState {
  String message;
  LoadVideoErrorState(this.message);
}

final class ChangeVideoStatusState extends ExerciseDetailsState{}

final class ExerciseChangedState extends ExerciseDetailsState {}

final class ExerciseDoneErrorState extends ExerciseDetailsState {
  String message;
  ExerciseDoneErrorState(this.message);
}
