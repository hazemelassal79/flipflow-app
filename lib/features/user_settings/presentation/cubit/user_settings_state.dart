part of 'user_settings_cubit.dart';

@immutable
sealed class UserSettingsState {}

final class UserSettingsInitial extends UserSettingsState {}

final class ChangePasswordVisibilityState extends UserSettingsState {}

final class ChangeEmailAddressLoadingState extends UserSettingsState {}

final class ChangeEmailAddressSuccessState extends UserSettingsState {
  final String message;
  ChangeEmailAddressSuccessState({required this.message});
}

final class ChangeEmailAddressErrorState extends UserSettingsState {
  final String message;
  ChangeEmailAddressErrorState({required this.message});
}

final class ChangePasswordLoadingState extends UserSettingsState {}

final class ChangePasswordSuccessState extends UserSettingsState {
  final String message;
  ChangePasswordSuccessState({required this.message});
}

final class ChangePasswordErrorState extends UserSettingsState {
  final String message;
  ChangePasswordErrorState({required this.message});
}

final class UserSignedOutLoadingState extends UserSettingsState {}

final class UserSignOutSuccessState extends UserSettingsState {}

final class UserSignOutErrorState extends UserSettingsState {
  final String message;
  UserSignOutErrorState({required this.message});
}
