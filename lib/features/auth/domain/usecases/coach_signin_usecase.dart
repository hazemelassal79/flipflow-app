import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flipflow_app/features/auth/domain/usecases/signin_usecase.dart';

class CoachSignInUseCase extends BaseUseCase<SignInUseCaseInput, CoachEntity> {
  final AuthRepository _authRepository;

  CoachSignInUseCase(this._authRepository);

  @override
  Future<Either<Failure, CoachEntity>> execute(input) async {
    return await _authRepository.coachSignIn(
        email: input.email, password: input.password);
  }
}
