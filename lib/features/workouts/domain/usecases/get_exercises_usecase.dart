import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flipflow_app/features/workouts/domain/repo/workout_repo.dart';

class GetExercisesUseCase
    extends BaseUseCase<List<String>, List<ExerciseEntity>> {
  final WorkoutRepository _repository;

  GetExercisesUseCase(this._repository);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> execute(
      List<String> input) async {
    return await _repository.getExercisesUsingUid(input);
  }
}
