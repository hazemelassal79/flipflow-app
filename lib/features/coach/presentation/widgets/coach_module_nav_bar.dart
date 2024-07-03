import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/coach/presentation/provider/coach_module_controller.dart';
import 'package:flipflow_app/features/home/presentation/widgets/nav_bar/custom_nav_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachModuleNavBar extends StatefulWidget {
  const CoachModuleNavBar({super.key});

  @override
  State<CoachModuleNavBar> createState() => _CoachModuleNavBarState();
}

class _CoachModuleNavBarState extends State<CoachModuleNavBar> {
  var items = [
    const BottomNavigationBarItem(
        icon: CustomNavBarIcon(
          svgImagePath: AssetsManager.homeIcon,
          iconSize: AppSize.s35,
        ),
        activeIcon: CustomNavBarIcon(
          svgImagePath: AssetsManager.homeIcon,
          iconSize: AppSize.s35,
          color: ColorManager.primary,
        ),
        label: AppStrings.coachHome),
    const BottomNavigationBarItem(
        icon: CustomNavBarIcon(
          svgImagePath: AssetsManager.scheduleIcon,
          color: ColorManager.lightGrey,
          iconSize: AppSize.s30,
        ),
        activeIcon: CustomNavBarIcon(
          svgImagePath: AssetsManager.scheduleIcon,
          iconSize: AppSize.s30,
          color: ColorManager.primary,
        ),
        label: AppStrings.coachCalender),
    const BottomNavigationBarItem(
        icon: CustomNavBarIcon(
          svgImagePath: AssetsManager.profileIcon,
          iconSize: AppSize.s24,
        ),
        activeIcon: CustomNavBarIcon(
          svgImagePath: AssetsManager.profileIcon,
          color: ColorManager.primary,
          iconSize: AppSize.s24,
        ),
        label: AppStrings.coachProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CoachModuleController>(
      builder: (context, data, child) {
        return BottomNavigationBar(
          items: items,
          currentIndex: data.navIndex,
          onTap: (index) {
            data.changeNavIndex(index);
          },
        );
      },
    );
  }
}
