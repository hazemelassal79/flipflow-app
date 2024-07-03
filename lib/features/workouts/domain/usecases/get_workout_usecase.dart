import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/workouts/domain/entities/filter_workout_entity.dart';
import 'package:flipflow_app/features/workouts/domain/repo/workout_repo.dart';

class GetWorkoutUseCase
    extends BaseUseCase<GetWorkoutUseCaseInput, List<WorkoutEntity>> {
  final WorkoutRepository _repository;

  GetWorkoutUseCase(this._repository);
  @override
  Future<Either<Failure, List<WorkoutEntity>>> execute(
      GetWorkoutUseCaseInput input) async {
    return await _repository.getWorkouts(FilterWorkoutsOptionEntity(
        isLessThan10Min: input.isLessThan10Min,
        isLessThan3Exersises: input.isLessThan3Exersises,
        query: input.query));
  }
}

class GetWorkoutUseCaseInput {
  final bool isLessThan10Min;
  final bool isLessThan3Exersises;
  final String query;
  GetWorkoutUseCaseInput(
      {required this.isLessThan10Min,
      required this.isLessThan3Exersises,
      required this.query});
}
