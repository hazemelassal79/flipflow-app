import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/exercise_details/exercise_details_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/exercise_details_bottom_sheet.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/exercise_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetailsView extends StatelessWidget {
  const ExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.get<ExerciseDetailsCubit>(),
      child: Scaffold(
        body: const CustomGradiantContainer(
          child: ExerciseDetailsViewBody(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.menu_book_rounded),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: ColorManager.gradiantPrimary,
                builder: (context) => const ExerciseDetailBottomSheet(),
                context: context);
          },
        ),
      ),
    );
  }
}
