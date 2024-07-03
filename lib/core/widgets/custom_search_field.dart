import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField(
      {super.key,
      required this.onSubmit,
      this.onFilterIconPressed,
      this.controller});
  final Function(String value) onSubmit;
  final Function()? onFilterIconPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: StylesManager.regular14.copyWith(color: ColorManager.black),
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
          hintText: AppStrings.search,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8, vertical: AppPadding.p8),
          suffixIcon: onFilterIconPressed != null
              ? GestureDetector(
                  onTap: onFilterIconPressed,
                  child: const CustomFormFieldIcon(
                      svgImagepath: AssetsManager.filterIcon))
              : null,
          prefixIcon: const Icon(
            Icons.search,
            color: ColorManager.lightGrey,
          )),
    );
  }
}
