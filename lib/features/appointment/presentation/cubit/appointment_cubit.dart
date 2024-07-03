import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/appointment/domain/usecases/cancel_appoointment_usecase.dart';
import 'package:flipflow_app/features/appointment/domain/usecases/create_appointment_usecase.dart';
import 'package:flipflow_app/features/appointment/domain/usecases/create_payment_key_usecase.dart';
import 'package:flipflow_app/features/appointment/domain/usecases/set_payment_status_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._appointmentUseCase, this._paymentKeyUsecase,
      this._setPaymentStatusUsecase, this._cancelAppointmentUseCase)
      : super(AppointmentInitial());

  final CreateAppointmentUseCase _appointmentUseCase;
  final CreatePaymentKeyUsecase _paymentKeyUsecase;
  final SetPaymentStatusUsecase _setPaymentStatusUsecase;
  final CancelAppointmentUseCase _cancelAppointmentUseCase;

  String _name = '';
  String _email = '';
  String _phoneNumber = '';

  set name(String name) => _name = name;

  set email(String email) => _email = email;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  AppointmentEntity? _appointmentEntity;

  AppointmentEntity? get appointmentEntity => _appointmentEntity;

  set setAppointmentEntity(AppointmentEntity? appointmentEntity) =>
      _appointmentEntity = appointmentEntity;

  Future<void> createAppointment({
    required String gymnasticTypeId,
    required String centerId,
    required String coachId,
  }) async {
    emit(CreateAppointmentLoadingState());
    final input = CreateAppointmentUseCaseInput(
        traineeName: _name,
        image: imageFile,
        traineeEmail: _email,
        traineeImageUrl: UiConstants.defaultUserImage,
        traineeAge: traineeAgeValue!,
        gymnasticTypeId: gymnasticTypeId,
        traineePhoneNumber: _phoneNumber,
        coachId: coachId,
        userId: ServiceLocator.get<UserEntity>().uid!,
        centerId: centerId,
        trainingTime: "$trainingDate , $trainingTime");

    final result = await _appointmentUseCase.execute(input);

    if (result.isRight()) {
      _appointmentEntity = result.right;
      changeStepper();
      emit(CreateAppointmentSuccessState());
      return;
    }
    emit(CreateAppointmentErrorState(result.failure.message));
  }

  String? paymentKey;

  Future<void> createPaymentKey({
    required int price,
  }) async {
    emit(CreatePaymentKeyLoadingState());
    final input = CreatePaymentKeyUsecaseInput(
        name: _appointmentEntity!.trainee!.name,
        email: _appointmentEntity!.trainee!.email,
        phoneNumber: _appointmentEntity!.trainee!.phoneNumber,
        price: (price * 100).toString());
    final result = await _paymentKeyUsecase.execute(input);
    if (result.isRight()) {
      paymentKey = result.right;
      emit(CreatePaymentKeySuccessState());
      return;
    }
    log("ERROR  : ${result.failure.message}");
    emit(CreatePaymentKeyErrorState(result.failure.message));
  }

  String getWebViewUrl() {
    return "https://accept.paymob.com/api/acceptance/iframes/837280?payment_token=$paymentKey";
  }

  Future<void> setPaymentStatus({
    required Function() onSuccess,
  }) async {
    emit(SetPaymentStatusLoadingState());
    final result = await _setPaymentStatusUsecase
        .execute(appointmentEntity!.appointmentId);
    if (result.isRight()) {
      onSuccess.call();
      emit(SetPaymentStatusSuccessState());
      return;
    }
    emit(SetPaymentStatusErrorState(result.failure.message));
  }

  Future<void> cancelAppointment() async {
    emit(CancelAppointmentLoadingState());
    final result = await _cancelAppointmentUseCase
        .execute(appointmentEntity!.appointmentId);
    if (result.isRight()) {
      emit(CancelAppointmentSuccessState());
      return;
    }
    emit(CancelAppointmentErrorState(result.failure.message));
  }

  // UI Functions

  double progress = 0;

  bool isLoading = false;

  void setIndicator(int progress) {
    this.progress = progress / 100;
    emit(SetIndicatorState());
  }

  int _stepperIndex = 0;

  int? _traineeAge;

  int? get traineeAgeValue => _traineeAge;

  int? selectedTimeIndex;

  String? trainingTime;
  String? trainingDate;

  void changeSelectedTimeIndex(int index, List times) {
    selectedTimeIndex = index;
    trainingTime = times[index];
    emit(ChangeSelectedTimeIndexState());
  }

  void setTrainingDate(String date) {
    trainingDate = date;
    selectedTimeIndex = null;
    trainingTime = null;
    emit(SetTrainingDateState());
  }

  void changeTraineeAge(int value) {
    _traineeAge = value;
    emit(ChangeTraineeAgeState());
  }

  int get stepperIndex => _stepperIndex;

  void changeStepper({bool isBack = false}) {
    if (isBack) {
      _stepperIndex--;
      emit(ChangeStepperState());
    } else if (_stepperIndex < 2) {
      _stepperIndex++;
    }
    emit(ChangeStepperState());
  }

  void clear() {
    _traineeAge = null;
    trainingDate = null;
    paymentKey = null;
    _name = '';
    _email = '';
    _phoneNumber = '';
    _appointmentEntity = null;
    trainingTime = null;
    imageFile = null;
    selectedTimeIndex = null;
    _stepperIndex = 0;
  }

  ImagePicker? imagePicker;
  File? imageFile;

  void pickImage() async {
    imagePicker = ImagePicker();
    final pickedFile =
        await imagePicker?.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    emit(PickImageState());
  }
}
