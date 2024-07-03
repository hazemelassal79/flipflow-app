import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/workout_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.workouts,
          style: StylesManager.bold24,
        ),
      ),
      body: CustomGradiantContainer(child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BlocBuilder<WorkoutsCubit, WorkoutsState>(
            builder: (context, state) {
              final cubit = context.read<WorkoutsCubit>();
              final homeCubit = context.read<HomeCubit>();
              if (homeCubit.userEntity == null &&
                  homeCubit.state is! HomeErrorState) {
                return const CustomLoadingWidget();
              }
              if (state is GetWorkoutsErrorState) {
                return CustomErrorWidget(
                  text: state.message,
                  onButtonPressed: () async {
                    await cubit.getWorkouts();
                    await homeCubit.initHomeData();
                  },
                );
              }
              return const WorkoutViewBody();
            },
          );
        },
      )),
    );
  }
}
