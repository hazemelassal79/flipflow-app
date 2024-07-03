import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.style});
  final Function()? onPressed;
  final String buttonText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: style ?? StylesManager.regular16,
        ));
  }
}
