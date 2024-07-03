import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/features/auth/domain/repo/auth_repo.dart';

class SignInUseCase extends BaseUseCase<SignInUseCaseInput, UserEntity> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(input) async {
    return await _authRepository.signIn(
        email: input.email, password: input.password);
  }
}

class SignInUseCaseInput {
  final String email;
  final String password;

  SignInUseCaseInput({required this.email, required this.password});
}
