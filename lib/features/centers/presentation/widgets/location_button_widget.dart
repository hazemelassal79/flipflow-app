import 'package:flipflow_app/core/entities/location_entity.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationButtonWidget extends StatelessWidget {
  const LocationButtonWidget(
      {super.key, this.color, required this.locationEntity});
  final Color? color;
  final LocationEntity locationEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s30,
      child: TextButton(
          onPressed: () {
            MapUtils.openMap(context, locationEntity);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetsManager.locationIcon,
                height: AppSize.s22,
                width: AppSize.s22,
                colorFilter: ColorFilter.mode(
                    color ?? ColorManager.white, BlendMode.srcIn),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Text(
                AppStrings.location,
                style: StylesManager.regular14
                    .copyWith(color: color ?? ColorManager.white),
              )
            ],
          )),
    );
  }
}
