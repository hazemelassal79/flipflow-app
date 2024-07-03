class WorkoutEntity {
  final String name;
  final String imageUrl;
  final List<String> exercises;
  final DateTime createdAt;
  final int numberOfExercises;
  final String uid;
  final int minutes;

  const WorkoutEntity(
      {required this.name,
      required this.imageUrl,
      required this.exercises,
      required this.createdAt,
      required this.numberOfExercises,
      required this.minutes,
      required this.uid});
}
