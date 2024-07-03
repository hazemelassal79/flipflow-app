import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomWelcomeWidget extends StatelessWidget {
  const CustomWelcomeWidget(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: StylesManager.bold18.copyWith(color: ColorManager.black)),
        TextSpan(text: "\n$subTitle", style: StylesManager.regular16),
      ]),
    );
  }
}
