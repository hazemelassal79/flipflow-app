import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/workouts_details/custom_container_widget.dart';
import 'package:flutter/material.dart';

class FlowHeaderWidget extends StatelessWidget {
  const FlowHeaderWidget(
      {super.key,
      required this.workoutName,
      required this.workoutTime,
      required this.numberOfExercises});

  final String workoutName;
  final int workoutTime;
  final int numberOfExercises;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workoutName,
          style: StylesManager.bold20,
        ),
        const SizedBox(
          height: AppSize.s12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainerWidget(
              icon: Icons.watch_later_outlined,
              text: "$workoutTime Minutes",
            ),
            CustomContainerWidget(
              icon: Icons.run_circle_outlined,
              text: "$numberOfExercises Exercises",
            ),
          ],
        ),
      ],
    );
  }
}
