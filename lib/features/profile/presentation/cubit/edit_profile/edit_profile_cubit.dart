import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._updateProfileUseCase) : super(EditProfileInitial());

  final UpdateProfileUseCase _updateProfileUseCase;

  ImagePicker? _imagePicker;

  File? image;

  Future<void> updateProfile(
    String name, {
    required Function() onDone,
  }) async {
    emit(EditProfileLoadingState());
    final result = await _updateProfileUseCase
        .execute(UpdateProfileUseCaseInput(username: name, image: image));
    if (result.isRight()) {
      await onDone.call();
      image = null;
      emit(EditProfileSuccessState());
    } else {
      emit(EditProfileErrorState(message: result.failure.message));
    }
  }

  void clear() {
    image = null;
  }

  // UI Functions

  void pickImage() async {
    _imagePicker = ImagePicker();
    final XFile? image =
        await _imagePicker?.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      emit(SelectImageState());
    }
  }
}
