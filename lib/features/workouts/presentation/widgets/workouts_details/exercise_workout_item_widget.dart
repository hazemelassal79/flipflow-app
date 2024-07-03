import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flipflow_app/features/workouts/domain/entities/exercise_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutExerciseItem extends StatelessWidget {
  const WorkoutExerciseItem(
      {super.key, required this.entity, required this.index});

  final ExerciseEntity entity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s100,
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context)
              .push(Routes.exerciseDetails, extra: index);
        },
        child: Card(
          color: ColorManager.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: AppSize.s2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: entity.imageUrl,
                height: AppSize.s100,
                width: AppSize.s90,
              ),
              const SizedBox(
                width: AppSize.s14,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.name,
                        style: StylesManager.bold18
                            .copyWith(color: ColorManager.black),
                      ),
                      Text("${entity.minutes} minutes",
                          style: StylesManager.regular14),
                      const Spacer(),
                      Container(
                        color: ColorManager.primaryWith10Opacity,
                        height: AppSize.s4,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(Routes.exerciseDetails, extra: index);
                  },
                  iconSize: AppSize.s20,
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorManager.primary,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
