import 'package:equatable/equatable.dart';
import 'package:flipflow_app/core/entities/location_entity.dart';

class CenterEntity {
  final String uid;
  final String name;
  final String imageUrl;
  final LocationEntity location;
  final List<GymnasticTypeEntity>? gymnasticTypes;
  final List<CenterScheduleDayEntity>? schedule;

  CenterEntity({
    required this.uid,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.gymnasticTypes,
    required this.schedule,
  });
}

class GymnasticTypeEntity {
  final String name;
  final String imageUrl;
  final List<String> coachesIds;
  final String appointmentPrice;
  final String uid;

  GymnasticTypeEntity(
      {required this.name,
      required this.imageUrl,
      required this.coachesIds,
      required this.appointmentPrice,
      required this.uid});
}

class CenterScheduleDayEntity {
  final String day;
  final String coachId;
  final String coachName;
  final String time;
  final String gymnasticTypeId;
  final String gymnasticTypeName;

  CenterScheduleDayEntity(
      {required this.day,
      required this.coachId,
      required this.coachName,
      required this.time,
      required this.gymnasticTypeId,
      required this.gymnasticTypeName});


  @override
  List<Object?> get props =>
      [day, coachId, coachName, gymnasticTypeId, gymnasticTypeName];
}
