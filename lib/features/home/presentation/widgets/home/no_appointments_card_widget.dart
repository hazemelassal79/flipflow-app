import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/providers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themed/themed.dart';

class NoAppointmentsCardWidget extends StatelessWidget {
  const NoAppointmentsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p8),
      child: SizedBox(
        height: UiConstants.noAppointmentsCardHeight,
        child: Card(
          elevation: AppSize.s4,
          shadowColor: ColorManager.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.loose,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: ChangeColors(
                    brightness: -0.13,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetsManager.noAppointmentsImage),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p16,
                    left: AppPadding.p26,
                    right: AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.noAppointmentsBooked,
                      style: StylesManager.bold18
                          .copyWith(color: ColorManager.white),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,

                      runSpacing: AppSize.s6,
                      children: [
                        Text(AppStrings.whatYouWait,
                            style: StylesManager.semiBold18),
                        const SizedBox(
                          width: AppSize.s18,
                        ),
                        TextButton(
                            onPressed: () {
                              final controller =
                                  context.read<LayoutController>();
                              controller.navigateToCenters();
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: ColorManager.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s16),
                                    side: const BorderSide(
                                      color: ColorManager.white,
                                      width: AppSize.s1,
                                    ))),
                            child: Text(AppStrings.bookNow,
                                style: StylesManager.semiBold16
                                    .copyWith(color: ColorManager.white))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
