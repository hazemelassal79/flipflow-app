import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/home/domain/repo/home_repository.dart';

class GetUserUseCase extends BaseUseCase<void, UserEntity> {
  final HomeRepository _repository;

  GetUserUseCase(this._repository);
  @override
  Future<Either<Failure, UserEntity>> execute([void input]) async {
    return await _repository.getUserData();
  }
}
