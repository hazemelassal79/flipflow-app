import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBarIcon extends StatelessWidget {
  final String svgImagePath;
  final Color? color;
  final double iconSize;
  const CustomNavBarIcon(
      {super.key,
      required this.svgImagePath,
      this.color,
      this.iconSize = AppSize.s30});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svgImagePath,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        height: iconSize,
        width: iconSize);
  }
}
