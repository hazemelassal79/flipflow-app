import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHeaderImage extends StatelessWidget {
  const CustomHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: SvgPicture.asset(
        height: AppSize.s35,
        width: AppSize.s35,
        AssetsManager.gymnastics_logo,
      ),
    );
  }
}
