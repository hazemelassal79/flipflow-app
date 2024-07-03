import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/user_settings/domain/repo/user_settings_repo.dart';

class SignOutUsecase extends BaseUseCase<void, void> {
  final UserSettingsRepository _userSettingsRepository;

  SignOutUsecase(this._userSettingsRepository);

  @override
  Future<Either<Failure, void>> execute([void input]) {
    return _userSettingsRepository.signOut();
  }
}
