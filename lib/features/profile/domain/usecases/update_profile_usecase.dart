import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/profile/data/requests/update_user_request.dart';
import 'package:flipflow_app/features/profile/domain/repo/profile_repository.dart';

class UpdateProfileUseCase
    extends BaseUseCase<UpdateProfileUseCaseInput, void> {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, void>> execute(UpdateProfileUseCaseInput input) {
    return _profileRepository.updateUserProfile(input);
  }
}

class UpdateProfileUseCaseInput extends UpdateUserProfileRequest {
  UpdateProfileUseCaseInput({required super.username, required super.image});
}
