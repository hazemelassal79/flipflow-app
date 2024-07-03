import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFormFieldIcon extends StatelessWidget {
  final String svgImagepath;
  const CustomFormFieldIcon({super.key, required this.svgImagepath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
      ),
      child: SvgPicture.asset(
        svgImagepath,
        fit: BoxFit.contain,
      ),
    );
  }
}
