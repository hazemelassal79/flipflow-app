import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/body_header_widget.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/gymnastics_list_view.dart';
import 'package:flutter/material.dart';

class CenterDetailsBodyWidget extends StatelessWidget {
  const CenterDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p18, vertical: AppPadding.p16),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: ColorManager.gradiantColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s20),
                topRight: Radius.circular(AppSize.s20))),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              BodyHeaderWidget(),
              GymnasticsTypeListView(),
            ],
          ),
        ));
  }
}
