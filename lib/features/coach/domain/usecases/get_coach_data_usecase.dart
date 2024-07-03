import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/coach/domain/repo/coach_repo.dart';

class GetCoachDataUseCase extends BaseUseCase<void, CoachEntity> {
  final CoachRepository _coachRepository;

  GetCoachDataUseCase(this._coachRepository);

  @override
  Future<Either<Failure, CoachEntity>> execute([void input]) async {
    return await _coachRepository.getCoachData();
  }
}
