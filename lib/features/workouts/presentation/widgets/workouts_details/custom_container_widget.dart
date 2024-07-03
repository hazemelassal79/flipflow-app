import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: const BoxDecoration(
          color: ColorManager.gradiantPrimary,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorManager.primary,
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
          Text(
            text,
            style:
                StylesManager.regular14.copyWith(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
