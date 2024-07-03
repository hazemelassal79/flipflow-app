import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeepProgressWidget extends StatelessWidget {
  const KeepProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = ServiceLocator.get<HomeCubit>();
        return Card(
          elevation: 3,
          color: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p4, horizontal: AppPadding.p4),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.trainingIcon,
                  height: AppSize.s45,
                  width: AppSize.s45,
                ),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.keepProgress,
                        style: StylesManager.semiBold16,
                      ),
                      Text(
                        'You have completed ${cubit.userEntity!.progress}% of workouts',
                        style: StylesManager.regular12
                            .copyWith(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
