import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/profile/data/requests/update_user_request.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> updateUserProfile(
      UpdateUserProfileRequest userRequest);
}
