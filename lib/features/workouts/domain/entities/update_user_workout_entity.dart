class UpdateUserWorkoutEntity {
  final String userId;
  final String workoutId;
  final String exerciseId;
  final bool isWorkoutDone;

  UpdateUserWorkoutEntity(
      {required this.userId,
      required this.workoutId,
      required this.exerciseId,
      required this.isWorkoutDone});
}
