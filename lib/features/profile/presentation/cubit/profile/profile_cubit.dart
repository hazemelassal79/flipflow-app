import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  UserEntity? _userEntity;

  UserEntity? get user => _userEntity;

  void setUser(UserEntity? value) {
    _userEntity = value;
    emit(UserUpdatedState());
  }

  void clear() {
    _userEntity = null;
    emit(ProfileInitial());
  }
}
