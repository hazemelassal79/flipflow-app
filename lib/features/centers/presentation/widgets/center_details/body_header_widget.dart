import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/table_bottom_sheet.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/location_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHeaderWidget extends StatelessWidget {
  const BodyHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.currentCenterEntity!.name,
                    style: StylesManager.semiBold18
                        .copyWith(color: ColorManager.black),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  LocationButtonWidget(
                      locationEntity: cubit.currentCenterEntity!.location,
                      color: ColorManager.primary),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const TableBottomSheetWidget());
              },
              child: Column(
                children: [
                  Image.asset(AssetsManager.calenderIcon,
                      height: AppSize.s40, width: AppSize.s40),
                  Text(
                    AppStrings.schedule,
                    style: StylesManager.semiBold16
                        .copyWith(color: ColorManager.black),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
