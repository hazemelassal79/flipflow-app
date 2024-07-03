import 'package:bloc/bloc.dart';
import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/utils/app_preferences.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/user_settings/domain/usecases/change_password_usecase.dart';
import 'package:flipflow_app/features/user_settings/domain/usecases/sign_out_usecase.dart';
import 'package:flipflow_app/features/user_settings/domain/usecases/update_email_usecase.dart';
import 'package:flutter/foundation.dart';

part 'user_settings_state.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  UserSettingsCubit(
    this._signOutUsecase,
    this._changePasswordUsecase,
    this._changeEmailUsecase,
    this._appPreferences,
  ) : super(UserSettingsInitial());

  final SignOutUsecase _signOutUsecase;

  final ChangePasswordUseCase _changePasswordUsecase;

  final ChangeEmailUseCase _changeEmailUsecase;

  final AppPreferences _appPreferences;

  bool get isCoach => _appPreferences.isCoach();

  Future<void> signOut() async {
    emit(UserSignedOutLoadingState());
    final data = await _signOutUsecase.execute();
    if (data.isRight()) {
      emit(UserSignOutSuccessState());
      await ServiceLocator.logout();
      return;
    }
    emit(UserSignOutErrorState(message: data.failure.message));
  }

  Future<void> updateEmail(String email) async {
    emit(ChangeEmailAddressLoadingState());
    final result = await _changeEmailUsecase.execute(email);

    if (result.isRight()) {
      emit(ChangeEmailAddressSuccessState(message: result.right));
    } else {
      emit(ChangeEmailAddressErrorState(message: result.failure.message));
    }
  }

  Future<void> updatePassword(String password) async {
    emit(ChangePasswordLoadingState());
    final result = await _changePasswordUsecase.execute(password);

    if (result.isRight()) {
      emit(ChangePasswordSuccessState(message: result.right));
    } else {
      emit(ChangePasswordErrorState(message: result.failure.message));
    }
  }

  // UI Functions

  bool isPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }
}
