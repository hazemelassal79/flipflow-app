import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentUserInfo extends StatelessWidget {
  const AppointmentUserInfo({
    super.key,
    required this.entity,
    this.isDateTime = false,
  });

  final AppointmentEntity entity;
  final bool isDateTime;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Text(_getData().keys.elementAt(index),
                style: StylesManager.semiBold16),
            const SizedBox(width: AppSize.s14),
            Expanded(
              child: Text(_getData().values.elementAt(index),
                  style: StylesManager.semiBold16
                      .copyWith(color: ColorManager.black)),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSize.s14);
      },
      itemCount: _getData().length,
    );
  }

  Map _getData() {
    if (isDateTime) {
      return {
        AppStrings.date: entity.trainingTime.toDateTime().toFormattedDate(),
        AppStrings.time: entity.trainingTime.toDateTime().toFormattedTime(),
      };
    }
    return {
      AppStrings.name: entity.trainee?.name,
      AppStrings.age: entity.trainee?.age.toString(),
      AppStrings.email: entity.trainee?.email,
      AppStrings.phone: entity.trainee?.phoneNumber,
    };
  }
}
