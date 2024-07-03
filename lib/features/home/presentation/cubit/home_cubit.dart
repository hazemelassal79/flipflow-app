import 'dart:developer';

import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/home/domain/use_cases/get_user_appointment_usecase.dart';
import 'package:flipflow_app/features/home/domain/use_cases/get_user_usecase.dart';
import 'package:flipflow_app/features/home/domain/use_cases/new_workouts_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this._userUseCase, this._newWorkoutsUseCase, this._appointmentUseCase)
      : super(HomeInitial());

  final GetUserUseCase _userUseCase;
  final GetNewWorkoutsUseCase _newWorkoutsUseCase;
  final GetUserAppointmentUseCase _appointmentUseCase;

  Future<void> initHomeData() async {
    if (state is HomeErrorState || state is HomeInitial) {
      if (_userEntity == null) {
        await getUserData();
      }
      if (_newWorkouts == null) {
        await getNewWorkouts();
      }
      if (_appointments == null) {
        await getUserAppointments();
      }
    }
  }

  UserEntity? _userEntity;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    final data = await _userUseCase.execute();
    if (data.isRight()) {
      ServiceLocator.register<UserEntity>(data.right);
      _userEntity = data.right;
      emit(GetUserDataSuccessState());
      return;
    }
    log(data.failure.message);
    emit(GetUserDataErrorState(data.failure.message));
  }

  UserEntity? get userEntity => _userEntity;

  set setUserEntity(UserEntity? value) => _userEntity = value;

  List<WorkoutEntity>? _newWorkouts;

  Future<void> getNewWorkouts() async {
    emit(GetNewWorkoutsLoadingState());
    final data = await _newWorkoutsUseCase.execute();
    if (data.isRight()) {
      _newWorkouts = data.right;
      emit(GetNewWorkoutsSuccessState());
      return;
    }
    emit(GetNewWorkoutsErrorState(data.failure.message));
  }

  List<WorkoutEntity>? get newWorkouts => _newWorkouts;

  List<AppointmentEntity>? _appointments;

  Future<void> getUserAppointments() async {
    _appointments = null;
    emit(GetUserAppointmentsLoadingState());
    final data = await _appointmentUseCase.execute();
    if (data.isRight()) {
      _appointments = data.right;
      emit(GetUserAppointmentsSuccessState());
      return;
    }
    emit(GetUserAppointmentsErrorState(data.failure.message));
  }

  List<AppointmentEntity>? get appointments => _appointments;

  bool get isError => (isLoading) && state is HomeErrorState;

  bool get isLoading => userEntity == null || newWorkouts == null;

  void clear() {
    _newWorkouts = null;
    _userEntity = null;
    _appointments = null;
    ServiceLocator.unregister<UserEntity>();
    emit(HomeInitial());
  }
}
