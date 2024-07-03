// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      imageUrl: json['imageUrl'] as String?,
      score: json['score'] as int?,
      age: json['age'] as int?,
      progress: json['progress'] as int?,
      doneWorkouts: (json['workouts'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
      'score': instance.score,
      'progress': instance.progress,
      'age': instance.age,
      'workouts': instance.doneWorkouts,
    };
