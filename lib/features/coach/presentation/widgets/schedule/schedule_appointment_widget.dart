

import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/location_button_widget.dart';
import 'package:flutter/material.dart';

class ScheduleAppointmentWidget extends StatelessWidget {
  const ScheduleAppointmentWidget(
      {super.key, required this.appointment, this.onSeeAllButtonPressed});

  final AppointmentEntity appointment;
  final Function()? onSeeAllButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.primary,
        ),
        child: Row(
          children: [
            CustomCircledImage(
              imageUrl: appointment.trainee!.imageUrl,
              radius: AppSize.s30,
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.trainee!.name,
                    style: StylesManager.semiBold16,
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Text("${startTime.toFormattedTime()} -  ${endTime.toFormattedTime()}",
                      style: StylesManager.regular12
                          .copyWith(color: ColorManager.white)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocationButtonWidget(
                        locationEntity: appointment.center!.location,
                      ),
                      Visibility(
                        visible: onSeeAllButtonPressed != null,
                        child: CustomTextButton(
                          onPressed: onSeeAllButtonPressed,
                          buttonText: AppStrings.seeAll,
                          style: StylesManager.regular12.copyWith(
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DateTime get startTime => appointment.trainingTime.toDateTime();

  DateTime get endTime => startTime.add(const Duration(hours: 2));
}
