import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class EstimatedCostWidget extends StatelessWidget {
  const EstimatedCostWidget({super.key, required this.cost});

  final String cost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.estimatedCost, style: StylesManager.bold16),
          Text("$cost EGP", style: StylesManager.bold16),
        ],
      ),
    );
  }
}
