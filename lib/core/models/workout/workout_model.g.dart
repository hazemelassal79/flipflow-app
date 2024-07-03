// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(
              (json['createdAt'] as Timestamp).toDate().toString()),
      numberOfExercises: json['numberOfExercises'] as int?,
      minutes: json['minutes'] as int?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'exercises': instance.exercises,
      'createdAt': Timestamp.fromDate(instance.createdAt ?? DateTime.now()),
      'numberOfExercises': instance.numberOfExercises,
      'uid': instance.uid,
      'minutes': instance.minutes,
    };