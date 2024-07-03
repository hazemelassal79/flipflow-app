import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flutter/material.dart';

class CustomGradiantContainer extends StatelessWidget {
  const CustomGradiantContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: ColorManager.gradiantColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
