import 'package:flipflow_app/core/entities/location_entity.dart';
import 'package:flipflow_app/core/models/location/location_model.dart';
import 'package:flipflow_app/core/utils/extensions.dart';

extension LocationModelToLocationEntityMapper on LocationModel? {
  LocationEntity toLocationEntity() {
    return LocationEntity(
      longitude: this?.longitude.orEmpty() ?? '',
      latitude: this?.latitude.orEmpty() ?? '',
    );
  }
}
