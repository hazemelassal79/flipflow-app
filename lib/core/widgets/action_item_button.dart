import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class ActionItemButton extends StatelessWidget {
  const ActionItemButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.icon});

  final String buttonName;
  final Function() onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            elevation: AppSize.s4,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
            shadowColor: ColorManager.lightGrey2,
            backgroundColor: ColorManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName,
                style: StylesManager.medium18,
              ),
              icon ?? const Icon(Icons.arrow_forward_ios_rounded)
            ],
          )),
    );
  }
}
