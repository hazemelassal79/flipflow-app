import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/workout_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
      final cubit = context.read<WorkoutsCubit>();
      return Scaffold(
        appBar: cubit.exercises != null
            ? null
            : AppBar(
                leading: const CustomBackArrow(),
              ),
        body: const CustomGradiantContainer(child: WorkoutDetailViewBody()),
      );
    });
  }
}
