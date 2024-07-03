import '../../domain/entities/update_user_workout_entity.dart';

class UpdateUserWorkoutRequest extends UpdateUserWorkoutEntity {
  UpdateUserWorkoutRequest(
      {required super.userId,
      required super.workoutId,
      required super.exerciseId,
      required super.isWorkoutDone});
}
