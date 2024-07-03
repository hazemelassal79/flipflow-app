import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator(
      {super.key, required this.value, required this.onPressed});

  final double value;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: AppSize.s80,
          height: AppSize.s80,
          child: CircularProgressIndicator(
            color: ColorManager.primary,
            value: value,
          ),
        ),
        Container(
          height: AppSize.s60,
          width: AppSize.s60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.primary.withOpacity(0.5)),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            iconSize: AppSize.s16,
          ),
        )
      ],
    );
  }
}
