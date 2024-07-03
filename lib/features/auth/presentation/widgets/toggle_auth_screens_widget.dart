import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class ToggleAuthScreensWidget extends StatelessWidget {
  final String descriptionText;
  final String buttonText;
  final Function()? onButtonPressed;
  const ToggleAuthScreensWidget(
      {super.key,
      required this.descriptionText,
      required this.buttonText,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(descriptionText, style: StylesManager.medium18)),
          TextButton(
              onPressed: onButtonPressed,
              child: Text(
                buttonText,
                style: StylesManager.bold16.copyWith(
                  color: ColorManager.primary,
                ),
              )),
        ],
      ),
    );
  }
}
