import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkoutFilterWidget extends StatefulWidget {
  const WorkoutFilterWidget({super.key});

  @override
  State<WorkoutFilterWidget> createState() => _WorkoutFilterWidgetState();
}

class _WorkoutFilterWidgetState extends State<WorkoutFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WorkoutsCubit>(),
      child: BlocBuilder<WorkoutsCubit, WorkoutsState>(
        builder: (context, state) {
          final cubit = context.read<WorkoutsCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Checkbox(
                    value: cubit.isLessThan10Min,
                    onChanged: (value) {
                      setState(() {
                        cubit.changeLessThan10MinFilter();
                      });
                    },
                  ),
                  title: Text(
                    AppStrings.lessThan10Min,
                    style: StylesManager.medium14,
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: cubit.isLessThan3Exercises,
                    onChanged: (value) {
                      setState(() {
                        cubit.changeLessThan3ExercisesFilter();
                      });
                    },
                  ),
                  title: Text(
                    AppStrings.lessThan3Exercises,
                    style: StylesManager.medium14,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                CustomButtonWidget(
                  buttonText: AppStrings.applyFitter,
                  onPressed: () {
                    GoRouter.of(context).pop();
                    cubit.getWorkouts();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
