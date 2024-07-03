import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel extends Equatable {
  final String? uid;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? videoUrl;
  final int? minutes;

  const ExerciseModel({
    required this.uid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.minutes,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  @override
  List<Object?> get props => [uid];
}
