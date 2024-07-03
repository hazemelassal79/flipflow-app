import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/custom_card_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/finished_exercises_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerStatsWidget extends StatelessWidget {
  const PlayerStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: FinishedExercisesWidget(),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomCardWidget(
                          title: AppStrings.progress,
                          svgImagePath: AssetsManager.armIcon,
                          dataUnit: AppStrings.workouts,
                          data: cubit.userEntity?.doneWorkouts?.length
                                  .toString() ??
                              "0"),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      CustomCardWidget(
                          title: AppStrings.traineeAge,
                          svgImagePath: AssetsManager.ageIcon,
                          dataUnit: AppStrings.years,
                          data: cubit.userEntity!.age.toString()),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
