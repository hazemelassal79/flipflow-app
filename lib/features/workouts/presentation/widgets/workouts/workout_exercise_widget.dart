import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/progress_indicator_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/workout_exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkoutExcerciseWidget extends StatelessWidget {
  const WorkoutExcerciseWidget({super.key, required this.entity});

  final WorkoutEntity entity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: GestureDetector(
        onTap: () async{
          final cubit = context.read<WorkoutsCubit>();
          cubit.setCurrentWorkout = entity;
          await cubit.getExercisesOfWorkout(entity);
          if(context.mounted){
            GoRouter.of(context).push(Routes.workoutDetails);
          }
        },
        child: Card(
          color: ColorManager.white,
          elevation: 2,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: entity.imageUrl,
                width: AppSize.s120,
                height: AppSize.s120,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p8, left: AppPadding.p8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WorkoutExcerciseDetails(
                        minutes: entity.minutes,
                        title: entity.name,
                        numOfExcercises: entity.numberOfExercises,
                      ),
                      const Spacer(),
                      ProgressIndicatorWidget(
                        entity: entity,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
