import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow(
      {super.key, this.radius = AppSize.s20, this.onTab, this.onNavigation});

  final double radius;
  final Function()? onTab;
  final Function()? onNavigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab ??
          () {
            GoRouter.of(context).pop();
            onNavigation?.call();
          },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: CircleAvatar(
          backgroundColor: ColorManager.primary,
          radius: radius,
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: AppSize.s18,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
