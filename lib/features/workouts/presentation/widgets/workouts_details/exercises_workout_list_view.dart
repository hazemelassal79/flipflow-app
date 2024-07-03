import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/exercise_workout_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutExercisesListView extends StatelessWidget {
  const WorkoutExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        return ListView.separated(
            padding: const EdgeInsets.only(bottom: AppPadding.pButtonHeight),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return WorkoutExerciseItem(
                entity: cubit.exercises![index],
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: AppSize.s12,
              );
            },
            itemCount: cubit.exercises!.length);
      },
    );
  }
}
