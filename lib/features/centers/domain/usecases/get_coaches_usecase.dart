import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/centers/domain/entity/coaches_filter_entity.dart';
import 'package:flipflow_app/features/centers/domain/repo/centers_repo.dart';

class GetCoachesUseCase
    extends BaseUseCase<GetCoachesUseCaseInput, List<CoachEntity>> {
  final CentersRepository _repository;

  GetCoachesUseCase(this._repository);

  @override
  Future<Either<Failure, List<CoachEntity>>> execute(
      GetCoachesUseCaseInput input) async {
    return await _repository.getCoachesOfGymnasticType(
        CoachesFilterEntity(query: input.query, coachesIds: input.coachesIds));
  }
}

class GetCoachesUseCaseInput extends CoachesFilterEntity {
  GetCoachesUseCaseInput({
    required super.query,
    required super.coachesIds,
  });
}
