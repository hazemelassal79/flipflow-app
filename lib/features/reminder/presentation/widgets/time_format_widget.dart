import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flutter/material.dart';

class TimeFormatWidget extends StatelessWidget {
  const TimeFormatWidget(
      {super.key,
      required this.onTap,
      required this.colorCondition,
      this.format = AppStrings.am});
  final Function(String) onTap;
  final bool colorCondition;
  final String format;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(format),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: colorCondition
              ? ColorManager.primary
              : ColorManager.primaryWith10Opacity,
        ),
        child: Text(
          format,
          style: StylesManager.semiBold16,
        ),
      ),
    );
  }
}
