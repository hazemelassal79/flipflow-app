import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.score,
    required this.age,
    required this.progress,
    required this.doneWorkouts,
  });

  final String? uid;
  final String? username;
  final String? email;
  final String? password;
  final String? imageUrl;
  final int? score;
  final int? age;
  final int? progress;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'workouts')
  final Map<String, List<String>>? doneWorkouts;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [uid];

  UserModel copyWith({
    String? uid,
    String? username,
    String? email,
    String? password,
    String? imageUrl,
    int? age,
    int? score,
    int? progress,
    Map<String, List<String>>? doneWorkouts,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        imageUrl: imageUrl ?? this.imageUrl,
        age: age ?? this.age,
        score: score ?? this.score,
        doneWorkouts: doneWorkouts ?? this.doneWorkouts,
        progress: progress ?? this.progress);
  }
}
