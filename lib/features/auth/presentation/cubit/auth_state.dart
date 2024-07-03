part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

sealed class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

final class AuthInitial extends AuthState {}

final class ShowHidePasswordState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInErrorState extends AuthErrorState {
  SignInErrorState(super.message);
}

final class RegisterSuccessState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterErrorState extends AuthErrorState {
  RegisterErrorState(super.message);
}

final class ChangeAgeState extends AuthState {}

final class EmailSentLoadingState extends AuthState {}

final class EmailSentSuccessState extends AuthState {
  final String message;
  EmailSentSuccessState(this.message);
}

final class EmailSentErrorState extends AuthErrorState {
  EmailSentErrorState(super.message);
}

final class ChangeIsTraineeOrCoachState extends AuthState {}
