import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "long")
  String? longitude;
  @JsonKey(name: 'lat')
  String? latitude;

  LocationModel({required this.longitude, required this.latitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
