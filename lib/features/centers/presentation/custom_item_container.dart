import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/cupertino.dart';

class CustomItemContainer extends StatelessWidget {
  const CustomItemContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.s90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p14, vertical: AppPadding.p8),
          child: child,
        ));
  }
}
