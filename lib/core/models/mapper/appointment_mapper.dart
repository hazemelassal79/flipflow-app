import 'dart:developer';

import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/trainee_entity.dart';
import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/appointment/trainee_model.dart';
import 'package:flipflow_app/core/models/mapper/coaches_mapper.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/centers/data/mapper/centers_mapper.dart';
import 'package:intl/intl.dart';

extension AppointmentModelToEntityMapper on AppointmentModel {
  AppointmentEntity toEntity() {
    return AppointmentEntity(
        appointmentId: appointmentId.orEmpty(),
        trainee: trainee?.toTraineeEntity(),
        center: center?.toCenterEntity(),
        coach: coach?.toCoachEntity(),
        gymnasticType: gymnasticType?.toGymnasticTypeEntity(),
        paymentStatus: paymentStatus.orEmpty(),
        trainingTime: trainingTime.orEmpty(),
        createdAt: createdAt ?? DateTime.now());
  }
  }
  //   return AppointmentEntity(
  //       appointmentId: appointmentId.orEmpty(),
  //       trainee: trainee?.toTraineeEntity(),
  //       center: center?.toCenterEntity(),
  //       coach: coach?.toCoachEntity(),
  //       gymnasticType: gymnasticType?.toGymnasticTypeEntity(),
  //       paymentStatus: paymentStatus.orEmpty(),
  //       trainingTime: _formattedDateTime(trainingTime.orEmpty()).toString(),
  //       createdAt: createdAt ?? DateTime.now());
  // }

  DateTime _formattedDateTime(String trainingTime) {
    final dateString =
        trainingTime.substring(0, trainingTime.lastIndexOf(',')).trim();
    final time =
        trainingTime.substring(trainingTime.lastIndexOf(',') + 1).trim();
    var date = DateFormat.yMMMEd().parse(dateString);
    if (date.isBefore(DateTime.now())) {
      final day = dateString.split(',')[0].trim();
      DaysOfWeek dayOfWeek = parseDayOfWeek(day.toLowerCase())!;
      final currentDate = DateTime.now();
      int daysUntilNextSameWeekday =
          (dayOfWeek.dateTimeValue - currentDate.weekday + 7) % 7;
      log(daysUntilNextSameWeekday.toString());
      date = currentDate.add(Duration(days: daysUntilNextSameWeekday));
    }
    return time.timeStringToDateTime(date);
  }

extension AppiontmentEntityToModelMapper on AppointmentEntity {
  AppointmentModel toModel() {
    return AppointmentModel(
      createdAt: createdAt,
      paymentStatus: paymentStatus,
      trainee: trainee?.toTraineeModel(),
      trainingTime: trainingTime,
    );
  }
}

extension TraineeModelToTraineeEntityMapper on TraineeModel? {
  TraineeEntity toTraineeEntity() {
    return TraineeEntity(
      name: this?.name.orEmpty() ?? '',
      email: this?.email.orEmpty() ?? '',
      age: this?.age.orZero() ?? 0,
      image: this?.image,
      uid: this?.uid.orEmpty() ?? '',
      phoneNumber: this?.phoneNumber.orEmpty() ?? '',
      imageUrl: this?.imageUrl ?? UiConstants.defaultUserImage,
    );
  }
}

extension TraineeEntityToTraineeModelMapper on TraineeEntity {
  TraineeModel toTraineeModel() {
    return TraineeModel(
      name: name,
      email: email,
      age: age,
      uid: uid,
      image: image,
      phoneNumber: phoneNumber,
      imageUrl: imageUrl,
    );
  }
}
