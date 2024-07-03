import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/exercise_flow_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/workout_details_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailViewBody extends StatelessWidget {
  const WorkoutDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        if (cubit.exercises == null && state is GetExercisesErrorState) {
          return CustomErrorWidget(text: state.message);
        }
        if (cubit.exercises == null) {
          return const CustomLoadingWidget();
        }

        return Stack(
          children: [
            const WorkoutDetailsHeader(),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: height * 0.32,
                child: const ExercisesFlowWidget()),
          ],
        );
      },
    );
  }
}
