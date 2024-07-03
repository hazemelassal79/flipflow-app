import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context,
    {required String text, Color color = ColorManager.errorColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: StylesManager.semiBold18,
    ),
    backgroundColor: color,
    duration: const Duration(milliseconds: UiConstants.snackBarDelay),
  ));
}
