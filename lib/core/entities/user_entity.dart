import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.age,
    required this.score,
    required this.username,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.doneWorkouts,
    required this.progress,
  });

  final String? uid;
  final String username;
  final String email;
  final String password;
  final String imageUrl;
  final int score;
  final int age;
  final int? progress;
  final Map<String, List<String>>? doneWorkouts;

  @override
  List<Object?> get props => [uid];
}
