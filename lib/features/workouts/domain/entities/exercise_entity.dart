class ExerciseEntity {
  final String uid;
  final String name;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final int minutes;

  const ExerciseEntity({
    required this.uid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.minutes,
  });
}
