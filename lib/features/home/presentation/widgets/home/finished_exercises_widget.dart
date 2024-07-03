import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinishedExercisesWidget extends StatelessWidget {
  const FinishedExercisesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.trophyIcon,
                      height: AppSize.s30,
                      width: AppSize.s30,
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(AppStrings.finished, style: StylesManager.semiBold16),
                  ],
                ),
                Text(
                  cubit.userEntity!.score.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: StylesManager.semiBold40.copyWith(
                    color: ColorManager.black,
                  ),
                ),
                Text(
                  AppStrings.completedExercises,
                  textAlign: TextAlign.center,
                  style: StylesManager.medium18
                      .copyWith(color: ColorManager.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
