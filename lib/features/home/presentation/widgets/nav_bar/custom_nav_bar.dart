import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/providers/layout_controller.dart';
import 'package:flipflow_app/features/home/presentation/widgets/nav_bar/custom_nav_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
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
        label: AppStrings.home),
    const BottomNavigationBarItem(
        icon: CustomNavBarIcon(
          svgImagePath: AssetsManager.dumbbellIcon,
        ),
        activeIcon: CustomNavBarIcon(
          svgImagePath: AssetsManager.dumbbellIcon,
          color: ColorManager.primary,
        ),
        label: AppStrings.workouts),
    const BottomNavigationBarItem(
        icon: CustomNavBarIcon(
          svgImagePath: AssetsManager.centerIcon,
        ),
        activeIcon: CustomNavBarIcon(
          svgImagePath: AssetsManager.centerIcon,
          color: ColorManager.primary,
        ),
        label: AppStrings.centers),
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
        label: AppStrings.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutController>(
      builder: (context, myData, child) {
        var provider = Provider.of<LayoutController>(context);
        return Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: ColorManager.black.withOpacity(0.4),
                blurRadius: AppSize.s6,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: provider.index,
            type: BottomNavigationBarType.fixed,
            items: items,
            onTap: (index) {
              provider.setIndex(index);
            },
          ),
        );
      },
    );
  }
}
