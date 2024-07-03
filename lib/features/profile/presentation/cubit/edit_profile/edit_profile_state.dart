part of 'edit_profile_cubit.dart';

sealed class EditProfileState {
  const EditProfileState();
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}

final class EditProfileSuccessState extends EditProfileState {}

final class EditProfileErrorState extends EditProfileState {
  final String message;
  const EditProfileErrorState({required this.message});
}

final class SelectImageState extends EditProfileState {}

