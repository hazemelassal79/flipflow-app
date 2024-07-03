import 'package:flipflow_app/features/workouts/presentation/cubits/exercise_details/exercise_details_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/exercise_app_bar.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/exercise_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetailsViewBody extends StatelessWidget {
  const ExerciseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsCubit, ExerciseDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ExerciseDetailsCubit>();
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            const ExerciseVideoWidget(),
            ExerciseAppBar(
                title: cubit.exercises?[cubit.exerciseEntityIndex].name ?? ''),
          ],
        );
      },
    );
  }
}
