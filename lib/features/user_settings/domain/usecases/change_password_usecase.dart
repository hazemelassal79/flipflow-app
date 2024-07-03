import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/user_settings/domain/repo/user_settings_repo.dart';

class ChangePasswordUseCase extends BaseUseCase<String, String> {
  final UserSettingsRepository _userSettingsRepository;

  ChangePasswordUseCase(this._userSettingsRepository);

  @override
  Future<Either<Failure, String>> execute(String input) {
    return _userSettingsRepository.changePassword(input);
  }
}
