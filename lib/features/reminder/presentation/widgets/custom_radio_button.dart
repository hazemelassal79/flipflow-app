import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flutter/material.dart';

class RadioItemWidget extends StatelessWidget {
  final String value;
  final String label;
  final String? groupValue;
  final Function(String?) onChanged;

  const RadioItemWidget({
    required this.value,
    required this.label,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: StylesManager.medium14.copyWith(color: ColorManager.black),
        ),
      ],
    );
  }
}
