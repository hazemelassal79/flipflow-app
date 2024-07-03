import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/exercises_workout_list_view.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/flow_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExercisesFlowWidget extends StatelessWidget {
  const ExercisesFlowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        return Container(
            decoration: const BoxDecoration(
                color: ColorManager.gradiantPrimary2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s30),
                    topRight: Radius.circular(AppSize.s30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p18, horizontal: AppPadding.p18),
              child: Stack(
                children: [
                   SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlowHeaderWidget(
                          workoutName: cubit.currentWorkout.name,
                          workoutTime: cubit.currentWorkout.minutes,
                          numberOfExercises: cubit.currentWorkout.numberOfExercises,
                        ),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        const WorkoutExercisesListView(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButtonWidget(
                      height: AppSize.s45,
                      raduis: AppSize.s30,
                      buttonText: AppStrings.start,
                      onPressed: () {
                        GoRouter.of(context).push(Routes.exerciseDetails);
                      },
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
