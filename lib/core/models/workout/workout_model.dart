import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  final String? name;
  final String? imageUrl;
  final List<String>? exercises;
  final DateTime? createdAt;
  final int? numberOfExercises;
  final String? uid;
  final int? minutes;

  WorkoutModel(
      {required this.name,
      required this.imageUrl,
      required this.exercises,
      required this.createdAt,
      required this.numberOfExercises,
      required this.minutes,
      required this.uid});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);


  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);    


}
