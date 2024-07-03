import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/auth/domain/repo/auth_repo.dart';

class RegisterUseCase extends BaseUseCase<RegisterUseCaseInput, UserEntity> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(input) async {
    return await _authRepository.createUserAccount(input);
  }
}

class RegisterUseCaseInput extends UserEntity {
  const RegisterUseCaseInput({
    required super.email,
    required super.age,
    required super.password,
    required super.username,
  }) : super(
          imageUrl: UiConstants.defaultUserImage,
          doneWorkouts: null,
          score: 0,
          uid: null,
          progress: 0,
        );
}
