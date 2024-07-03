// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterModel _$CenterModelFromJson(Map<String, dynamic> json) => CenterModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      gymnasticTypes: (json['gymnasticTypes'] as List<dynamic>?)
          ?.map((e) => GymnasticTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map(
              (e) => CenterScheduleDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CenterModelToJson(CenterModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'location': instance.location?.toJson(),
    };

GymnasticTypeModel _$GymnasticTypeModelFromJson(Map<String, dynamic> json) =>
    GymnasticTypeModel(
      name: json['name'] as String?,
      appointmentPrice: json['appointmentPrice'] as String?,
      imageUrl: json['imageUrl'] as String?,
      coachesIds:
          (json['coaches'] as List<dynamic>?)?.map((e) => e as String).toList(),
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$GymnasticTypeModelToJson(GymnasticTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'coaches': instance.coachesIds,
      'appointmentPrice': instance.appointmentPrice,
      'uid': instance.uid,
    };

CenterScheduleDayModel _$CenterScheduleDayModelFromJson(
        Map<String, dynamic> json) =>
    CenterScheduleDayModel(
      day: json['day'] as String?,
      coachId: json['coachId'] as String?,
      coachName: json['coachName'] as String?,
      time: json['time'] as String?,
      gymnasticTypeId: json['gymnasticTypeId'] as String?,
      gymnasticTypeName: json['gymnasticTypeName'] as String?,
    );

Map<String, dynamic> _$CenterScheduleDayModelToJson(
        CenterScheduleDayModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'coachId': instance.coachId,
      'coachName': instance.coachName,
      'time': instance.time,
      'type': instance.gymnasticTypeId,
      'gymnasticTypeName': instance.gymnasticTypeName,
    };
