import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/home/domain/repo/home_repository.dart';

class GetNewWorkoutsUseCase extends BaseUseCase<void, List<WorkoutEntity>> {
  final HomeRepository _repository;

  GetNewWorkoutsUseCase(this._repository);

  @override
  Future<Either<Failure, List<WorkoutEntity>>> execute([void input]) async {
    return await _repository.getNewWorkouts();
  }
}
