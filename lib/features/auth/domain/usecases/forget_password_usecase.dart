import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase extends BaseUseCase<String, String> {
  final AuthRepository _authRepository;

  ForgetPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, String>> execute(input) async {
    return await _authRepository.sendPasswordResetEmail(email: input);
  }
}
