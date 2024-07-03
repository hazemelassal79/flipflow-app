import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key, required this.entity});
  final WorkoutEntity entity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        var cubit = ServiceLocator.get<WorkoutsCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${cubit.userWorkoutProgress(entity)}/${entity.numberOfExercises}',
              style:
                  StylesManager.regular12.copyWith(color: ColorManager.black),
            ),
            LayoutBuilder(builder: (context, constrains) {
              final width = constrains.maxWidth;
              return Container(
                  decoration: BoxDecoration(
                      color: ColorManager.primaryWith10Opacity,
                      borderRadius: BorderRadius.circular(AppSize.s18)),
                  height: AppSize.s6,
                  width: width * 0.7,
                  child: FractionallySizedBox(
                    widthFactor: cubit.userWorkoutProgress(entity) /
                        entity.numberOfExercises,
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(AppSize.s18)),
                      height: AppSize.s6,
                    ),
                  ));
            }),
          ],
        );
      },
    );
  }
}
