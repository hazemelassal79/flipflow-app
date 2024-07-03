import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/utils/extensions.dart';

extension CoachModelToCoachesEntityMapper on CoachModel {
  CoachEntity toCoachEntity() {
    return CoachEntity(
      name: name.orEmpty(),
      email: email.orEmpty(),
      imageUrl: imageUrl ?? UiConstants.defaultUserImage,
      experience: experience.orZero(),
      phoneNumber: phoneNumber.orEmpty(),
      uid: uid.orEmpty(),
    );
  }
}
