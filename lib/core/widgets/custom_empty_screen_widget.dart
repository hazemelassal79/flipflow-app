import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AssetsManager.workoutJson,
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Text(
            text ?? AppStrings.empty,
            style: StylesManager.medium18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
