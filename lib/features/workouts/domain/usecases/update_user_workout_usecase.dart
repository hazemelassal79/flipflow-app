import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/workouts/domain/entities/update_user_workout_entity.dart';
import 'package:flipflow_app/features/workouts/domain/repo/workout_repo.dart';

class UpdateUserWorkoutUseCase
    extends BaseUseCase<UpdateUserWorkoutInput, void> {
  final WorkoutRepository _repository;

  UpdateUserWorkoutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(UpdateUserWorkoutInput input) {
    return _repository.updateUserWorkout(input);
  }
}

class UpdateUserWorkoutInput extends UpdateUserWorkoutEntity {
  UpdateUserWorkoutInput(
      {required super.userId,
      required super.workoutId,
      required super.exerciseId,
      required super.isWorkoutDone});
}
