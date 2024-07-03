

import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TraineeInfoWidget extends StatelessWidget {
  const TraineeInfoWidget({super.key, required this.entity});

  final AppointmentEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entity.trainee!.name,
          style: StylesManager.bold20,
        ),
        Text(
          "${entity.trainee!.age} years old",
          style: StylesManager.regular12.copyWith(color: ColorManager.white),
        ),
        Text(
          "${entity.trainingTime.toDateTime().toFormattedDate()} - ${entity.trainingTime.toDateTime().toFormattedTime()}",
          style: StylesManager.regular12.copyWith(color: ColorManager.white),
        ),
      ],
    );
  }
}
