import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flipflow_app/features/workouts/domain/usecases/get_exercises_usecase.dart';
import 'package:flipflow_app/features/workouts/domain/usecases/get_workout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit(this._workoutUseCase, this._exercisesUseCase)
      : super(WorkoutsInitial());
  final GetWorkoutUseCase _workoutUseCase;
  final GetExercisesUseCase _exercisesUseCase;

  List<WorkoutEntity>? _workouts;

  Future<void> getWorkouts([String? searchQuery]) async {
    emit(GetWorkoutsLoadingState());

    final data = await _workoutUseCase.execute(GetWorkoutUseCaseInput(
        isLessThan10Min: isLessThan10Min,
        isLessThan3Exersises: isLessThan3Exercises,
        query: searchQuery.orEmpty()));

    if (data.isRight()) {
      _workouts = data.right;
      emit(GetWorkoutsSuccessState());
      return;
    }
    emit(GetWorkoutsErrorState(data.failure.message));
  }

  List<WorkoutEntity>? get workouts => _workouts;

  late WorkoutEntity _currentWorkout;
  set setCurrentWorkout(WorkoutEntity value) => _currentWorkout = value;

  WorkoutEntity get currentWorkout => _currentWorkout;

  List<ExerciseEntity>? _exercises;
  Future<void> getExercisesOfWorkout(WorkoutEntity workoutEntity) async {
    _exercises = null;
    emit(GetExercisesLoadingState());
    final data = await _exercisesUseCase.execute(workoutEntity.exercises);

    if (data.isRight()) {
      _exercises = data.right;
      log(_exercises.toString());
      emit(GetExercisesSuccessState());
      return;
    }
    emit(GetExercisesErrorState(data.failure.message));
  }

  bool isLessThan10Min = false;
  bool isLessThan3Exercises = false;

  void changeLessThan10MinFilter() {
    isLessThan10Min = !isLessThan10Min;
  }

  void changeLessThan3ExercisesFilter() {
    isLessThan3Exercises = !isLessThan3Exercises;
  }

  List<ExerciseEntity>? get exercises => _exercises;

  void clearExercises() => _exercises = null;

  int userWorkoutProgress(WorkoutEntity workoutEntity) {
    final user = ServiceLocator.get<UserEntity>();
    final userWorkout = user.doneWorkouts?[workoutEntity.uid];
    return userWorkout?.length ?? 0;
  }

  void clear() {
    _workouts = null;
    _exercises = null;
    emit(WorkoutsInitial());
  }
}
