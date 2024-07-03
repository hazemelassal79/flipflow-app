import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExerciseDetailsTextWidget extends StatelessWidget {
  const ExerciseDetailsTextWidget(
      {super.key, required this.order, required this.text});
  final int order;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: AppSize.s24,
          width: AppSize.s24,
          decoration: const BoxDecoration(
              color: ColorManager.white, shape: BoxShape.circle),
          child: Text(
            '$order',
            textAlign: TextAlign.center,
            style: StylesManager.bold18,
          ),
        ),
        const SizedBox(
          width: AppSize.s12,
        ),
        Expanded(
          child: Text(text, style: StylesManager.medium12),
        ),
      ],
    );
  }
}
