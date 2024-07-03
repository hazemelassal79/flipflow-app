import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/domain/repo/centers_repo.dart';

class GetCenterDetailsUseCase extends BaseUseCase<String, CenterEntity> {
  final CentersRepository _repository;

  GetCenterDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, CenterEntity>> execute(String input) async {
    return await _repository.getCenterDetails(input);
  }
}
