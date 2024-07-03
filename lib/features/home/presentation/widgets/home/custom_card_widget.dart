import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      required this.title,
      required this.svgImagePath,
      this.dataUnit,
      required this.data});

  final String title;
  final String svgImagePath;
  final String? dataUnit;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: ColorManager.primary,
      shadowColor: ColorManager.grey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  svgImagePath,
                  height: AppSize.s26,
                  colorFilter: const ColorFilter.mode(
                      ColorManager.white, BlendMode.srcIn),
                  width: AppSize.s26,
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Expanded(child: Text(title, style: StylesManager.semiBold16)),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: AppSize.s8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  data,
                  style: StylesManager.semiBold24.copyWith(
                    color: ColorManager.black,
                  ),
                ),
                if (dataUnit != null) ...[
                  Text(dataUnit!,
                      style: StylesManager.medium14.copyWith(
                        color: ColorManager.white,
                      )),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
