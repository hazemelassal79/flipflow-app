import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.height = AppSize.s60,
      this.raduis = AppSize.s14});
  final String buttonText;
  final double height;
  final double raduis;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(raduis))),
          child: Text(buttonText, style: StylesManager.semiBold18)),
    );
  }
}
