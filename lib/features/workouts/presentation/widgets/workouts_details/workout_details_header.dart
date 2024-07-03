import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsHeader extends StatelessWidget {
  const WorkoutDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        return Stack(
          children: [
            CustomNetworkImage(
              imageUrl: cubit.currentWorkout.imageUrl,
              width: double.infinity,
              height: height * 0.34,
            ),
            Positioned(
              height: height * 0.15,
              child: CustomBackArrow(
                onNavigation: () {
                  cubit.clearExercises();
                },
                radius: AppSize.s16,
              ),
            ),
          ],
        );
      },
    );
  }
}
