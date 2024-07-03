import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_empty_screen_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/core/widgets/custom_search_field.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/workout_filter_widget.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts/workouts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutViewBody extends StatefulWidget {
  const WorkoutViewBody({super.key});

  @override
  State<WorkoutViewBody> createState() => _WorkoutViewBodyState();
}

class _WorkoutViewBodyState extends State<WorkoutViewBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutsCubit>();
        if (cubit.workouts == null || state is GetWorkoutsLoadingState) {
          return const CustomLoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: RefreshIndicator(
            displacement: 1,
            onRefresh: () async {
              cubit.clear();
              await cubit.getWorkouts();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  CustomSearchField(
                    controller: _controller,
                    onSubmit: (value) async {
                      if (value.trim().isNotEmpty) {
                        await cubit.getWorkouts(value.trim());
                      }
                    },
                    onFilterIconPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const WorkoutFilterWidget();
                        },
                      );
                    },
                  ),
                  if (cubit.workouts?.isEmpty ?? true) ...[
                    const CustomEmptyScreen(),
                  ] else ...[
                    const WorkoutListView(),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
