import 'package:flipflow_app/features/workouts/data/models/update_user_workout_model.dart';
import 'package:flipflow_app/features/workouts/domain/entities/update_user_workout_entity.dart';

extension UpdateUserWorkoutMapper on UpdateUserWorkoutEntity {
  UpdateUserWorkoutRequest toUpdateUserWorkoutRequest() {
    return UpdateUserWorkoutRequest(
        userId: userId,
        workoutId: workoutId,
        exerciseId: exerciseId,
        isWorkoutDone: isWorkoutDone);
  }
}
