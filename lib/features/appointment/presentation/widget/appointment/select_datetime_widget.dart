import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment/date_picker_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment/time_picker_widget.dart';
import 'package:flutter/material.dart';

class SelectDateTimeWidget extends StatelessWidget {
  const SelectDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
            color: ColorManager.primary,
          ),
          child: Column(children: [
            const CustomDatePickerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: ColorManager.lightGrey,
                  ),
                  Text(
                    AppStrings.time,
                    style: StylesManager.bold16,
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  const CustomTimePickerWidget(),
                ],
              ),
            ),
          ])),
    );
  }
}
