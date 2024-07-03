import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
          ],
        ));
  }
}
