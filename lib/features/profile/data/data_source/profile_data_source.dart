import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/features/profile/data/requests/update_user_request.dart';

abstract class ProfileDataSource {
  Future<UserModel> updateUserProfile(UpdateUserProfileRequest userRequest);
}
