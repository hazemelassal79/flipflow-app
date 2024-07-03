import 'package:flipflow_app/core/utils/app_preferences.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/auth/domain/usecases/coach_signin_usecase.dart';
import 'package:flipflow_app/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:flipflow_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:flipflow_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this._signInUseCase,
      this._registerUseCase,
      this._coachSignInUseCase,
      this._forgetPasswordUseCase,
      this._appPreferences)
      : super(AuthInitial());

  final SignInUseCase _signInUseCase;
  final RegisterUseCase _registerUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final CoachSignInUseCase _coachSignInUseCase;
  final AppPreferences _appPreferences;

  void coachSignIn({
    required String email,
    required String password,
    required Function() onDone,
  }) async {
    emit(SignInLoadingState());
    final data = await _coachSignInUseCase
        .execute(SignInUseCaseInput(email: email, password: password));

    if (data.isRight()) {
      await _appPreferences.setUserLoggedIn(data.right.uid);
      await _appPreferences.setCoachLoggedIn();
      onDone.call();
      emit(SignInSuccessState());
    } else {
      emit(SignInErrorState(data.failure.message));
    }
  }

  void signIn({
    required String email,
    required String password,
    required Function() onDone,
  }) async {
    emit(SignInLoadingState());
    final data = await _signInUseCase
        .execute(SignInUseCaseInput(email: email, password: password));

    if (data.isRight()) {
      await _appPreferences.setUserLoggedIn(data.right.uid!);
      onDone.call();
      emit(SignInSuccessState());
    } else {
      emit(SignInErrorState(data.failure.message));
    }
  }

  int? _age;

  int? get age => _age;

  void setAge(int age) {
    _age = age;
    emit(ChangeAgeState());
  }

  bool _isTrainee = true;

  bool get isTrainee => _isTrainee;

  void setAsCoach() {
    _isTrainee = false;
    emit(ChangeIsTraineeOrCoachState());
  }

  void setAsTrainee() {
    _isTrainee = true;
    emit(ChangeIsTraineeOrCoachState());
  }

  void register({
    required String email,
    required String username,
    required String password,
    required Function() onDone,
  }) async {
    emit(RegisterLoadingState());
    final data = await _registerUseCase.execute(RegisterUseCaseInput(
        username: username, email: email, password: password, age: age!));

    if (data.isRight()) {
      await _appPreferences.setUserLoggedIn(data.right.uid!);
      onDone.call();
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState(data.failure.message));
    }
  }

  void sendPasswordResetMail({
    required String email,
  }) async {
    emit(EmailSentLoadingState());
    final data = await _forgetPasswordUseCase.execute(email);
    if (data.isRight()) {
      emit(EmailSentSuccessState(data.right));
    } else {
      emit(EmailSentErrorState(data.failure.message));
    }
  }

  bool isShownPassword = true;

  void setPasswordVisibility() {
    isShownPassword = !isShownPassword;
    emit(ShowHidePasswordState());
  }
}
