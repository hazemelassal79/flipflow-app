import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/coach/data/requests/update_coach_model.dart';
import 'package:flipflow_app/features/coach/domain/repo/coach_repo.dart';

class UpdateCoachDataUseCase
    extends BaseUseCase<UpdateCoachDataRequest, CoachEntity> {
  final CoachRepository _coachRepository;

  UpdateCoachDataUseCase(this._coachRepository);

  @override
  Future<Either<Failure, CoachEntity>> execute(
      UpdateCoachDataRequest input) async {
    return await _coachRepository.updateCoachData(input);
  }
}

class UpdateCoachDataUseCaseInput extends UpdateCoachDataRequest {
  UpdateCoachDataUseCaseInput(
      {required super.name, required super.phoneNumber, required super.image})
      : super(imageUrl: '');
}
