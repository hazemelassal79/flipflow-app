import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class FieldNameText extends StatelessWidget {
  const FieldNameText({super.key, required this.fieldName});

  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
      child: Text(
        fieldName,
        style: StylesManager.bold16,
      ),
    );
  }
}
