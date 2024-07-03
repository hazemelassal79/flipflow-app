import 'package:flipflow_app/core/models/mapper/location_mapper.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';
import 'package:flipflow_app/features/centers/data/models/coaches_filter_model.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/domain/entity/coaches_filter_entity.dart';

extension CenterModelToEntityMapper on CenterModel {
  CenterEntity toCenterEntity() {
    return CenterEntity(
      uid: uid.orEmpty(),
      name: name.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      location: location.toLocationEntity(),
      schedule: schedule?.map((e) => e.toScheduleDayEntity()).toList(),
      gymnasticTypes:
          gymnasticTypes?.map((e) => e.toGymnasticTypeEntity()).toList(),
    );
  }
}

extension CoachesFilterEntityToCoachesFilterModelMapper on CoachesFilterEntity {
  CoachesFilterModel toCoachesFilterModel() {
    return CoachesFilterModel(coachesIds: coachesIds, query: query);
  }
}

extension GymnasticTypeModelToEntityMapper on GymnasticTypeModel {
  GymnasticTypeEntity toGymnasticTypeEntity() {
    return GymnasticTypeEntity(
      name: name.orEmpty(),
      appointmentPrice: appointmentPrice.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      coachesIds: coachesIds ?? [],
      uid: uid.orEmpty(),
    );
  }
}

extension SchedualDayModelToEntityMapper on CenterScheduleDayModel {
  CenterScheduleDayEntity toScheduleDayEntity() {
    return CenterScheduleDayEntity(
      day: day.orEmpty(),
      time: time.orEmpty(),
      coachId: coachId.orEmpty(),
      coachName: coachName.orEmpty(),
      gymnasticTypeId: gymnasticTypeId.orEmpty(),
      gymnasticTypeName: gymnasticTypeName.orEmpty(),
    );
  }
}
