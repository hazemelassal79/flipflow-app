import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flutter/material.dart';

class ExerciseAppBar extends StatelessWidget {
  final String title;
  const ExerciseAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
      child: Row(
        children: [
          const CustomBackArrow(
            radius: AppSize.s16,
          ),
          Text(
            title,
            style: StylesManager.bold18.copyWith(color: ColorManager.black),
          ),
        ],
      ),
    );
  }
}
