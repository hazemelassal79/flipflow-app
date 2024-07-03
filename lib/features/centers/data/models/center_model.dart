import 'package:flipflow_app/core/models/location/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'center_model.g.dart';

@JsonSerializable()
class CenterModel {
  final String? uid;
  final String? name;
  final String? imageUrl;
  final LocationModel? location;
  final List<GymnasticTypeModel>? gymnasticTypes;
  final List<CenterScheduleDayModel>? schedule;

  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);

  CenterModel({
    this.uid,
    this.name,
    this.imageUrl,
    this.location,
    this.gymnasticTypes,
    this.schedule,
  });

  Map<String, dynamic> toJson() => _$CenterModelToJson(this);

  copyWith({
    String? uid,
    String? name,
    String? imageUrl,
    LocationModel? location,
    List<GymnasticTypeModel>? gymnasticTypes,
    List<CenterScheduleDayModel>? schedule,
  }) {
    return CenterModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      gymnasticTypes: gymnasticTypes ?? this.gymnasticTypes,
      schedule: schedule ?? this.schedule,
    );
  }
}

@JsonSerializable()
class GymnasticTypeModel {
  final String? name;
  final String? imageUrl;
  @JsonKey(name: 'coaches')
  final List<String>? coachesIds;
  final String? uid;
  final String? appointmentPrice;

  GymnasticTypeModel(
      {this.name,
      this.imageUrl,
      this.coachesIds,
      required this.uid,
      required this.appointmentPrice});

  factory GymnasticTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GymnasticTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymnasticTypeModelToJson(this);
}

@JsonSerializable()
class CenterScheduleDayModel {
  final String? day;
  final String? coachId;
  final String? coachName;
  final String? time;
  final String? gymnasticTypeId;
  final String? gymnasticTypeName;

  factory CenterScheduleDayModel.fromJson(Map<String, dynamic> json) =>
      _$CenterScheduleDayModelFromJson(json);

  CenterScheduleDayModel(
      {required this.day,
      required this.coachId,
      required this.coachName,
      required this.time,
      required this.gymnasticTypeId,
      required this.gymnasticTypeName});

  Map<String, dynamic> toJson() => _$CenterScheduleDayModelToJson(this);
}
