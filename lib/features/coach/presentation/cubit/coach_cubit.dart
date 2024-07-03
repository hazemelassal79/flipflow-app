import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/coach/domain/usecases/get_appointments_usecase.dart';
import 'package:flipflow_app/features/coach/domain/usecases/get_coach_data_usecase.dart';
import 'package:flipflow_app/features/coach/domain/usecases/update_coach_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit(this._getCoachDataUseCase, this._getAppointmentsUseCase,
      this._updateCoachDataUseCase)
      : super(CoachInitial());
  final GetCoachDataUseCase _getCoachDataUseCase;
  final GetAppointmentsUseCase _getAppointmentsUseCase;
  final UpdateCoachDataUseCase _updateCoachDataUseCase;

  CoachEntity? _coachEntity;

  CoachEntity? get coachEntity => _coachEntity;

  Future<void> getCoachData() async {
    emit(GetCoachDataLoadingState());
    final result = await _getCoachDataUseCase.execute();

    if (result.isRight()) {
      _coachEntity = result.right;
      emit(GetCoachDataSuccessState());
      return;
    }

    emit(GetCoachDataErrorState(result.failure.message));
  }

  List<AppointmentEntity>? appointments;

  Future<void> getAppointments() async {
    emit(GetAppointmentsLoadingState());
    final result = await _getAppointmentsUseCase.execute();

    if (result.isRight()) {
      appointments = result.right;
      emit(GetAppointmentsSuccessState());
      return;
    }

    emit(GetAppointmentsErrorState(result.failure.message));
  }

  Future<void> initCoachHomeData() async {
    if (_coachEntity == null) {
      await getCoachData();
    }
    if (appointments == null) {
      await getAppointments();
    }
  }

  Future<void> updateCoachData({
    required String? name,
    required String? phoneNumber,
  }) async {
    emit(UpdateCoachDataLoadingState());
    final input = UpdateCoachDataUseCaseInput(
        name: name, phoneNumber: phoneNumber, image: image);
    final result = await _updateCoachDataUseCase.execute(input);
    if (result.isRight()) {
      _coachEntity = result.right;
      emit(UpdateCoachDataSuccessState());
      return;
    }
    emit(UpdateCoachDataErrorState(result.failure.message));
  }

  void clear() {
    _coachEntity = null;
    appointments = null;
    image = null;
    emit(CoachInitial());
  }

  // UI Functions

  List<Appointment> get scheduleAppointments => _getAppointments();

  List<Appointment> _getAppointments() {
    List<Appointment> appointments = [];

    if (this.appointments != null) {
      for (var element in this.appointments!) {
        final startTime = element.trainingTime.toDateTime();
        final endTime = startTime.add(const Duration(hours: 2));
        Appointment? appointment;
        try {
          appointment = appointments
              .firstWhere((element) => element.startTime == startTime);
        } catch (e) {
          appointment = null;
        }
        if (appointment != null) {
          appointment.resourceIds?.add(element);
          continue;
        }
        appointments.add(Appointment(
          startTime: startTime,
          endTime: endTime,
          resourceIds: <AppointmentEntity>[element],
        ));
      }
    }
    return appointments;
  }

  File? image;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    emit(ImagePickedState());
  }

  void clearImage() {
    if (image == null) return;
    image = null;
    emit(ImagePickedState());
  }
}
