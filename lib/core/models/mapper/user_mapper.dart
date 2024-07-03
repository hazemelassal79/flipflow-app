import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/utils/extensions.dart';

extension UserModelToUserEntityMapper on UserModel {
  UserEntity toUserEntity() {
    return UserEntity(
        uid: uid,
        age: age.orZero(),
        score: score.orZero(),
        doneWorkouts: doneWorkouts ?? {},
        username: username.orEmpty(),
        email: email.orEmpty(),
        password: password.orEmpty(),
        progress: progress,
        imageUrl: imageUrl ?? UiConstants.defaultUserImage);
  }
}

extension UserEntityToUserModelMapper on UserEntity {
  UserModel toUserModel() {
    return UserModel(
        uid: uid,
        doneWorkouts: doneWorkouts,
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        score: score,
        age: age,
        progress: progress);
  }
}
