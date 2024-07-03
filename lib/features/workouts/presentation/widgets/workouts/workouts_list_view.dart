import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/workout_exercise_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
            itemBuilder: (context, index) {
              return WorkoutExcerciseWidget(
                entity: cubit.workouts![index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: AppSize.s12,
              );
            },
            itemCount: cubit.workouts?.length ?? 0);
      },
    );
  }
}
