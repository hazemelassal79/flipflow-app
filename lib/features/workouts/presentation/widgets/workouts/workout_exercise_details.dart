import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flutter/cupertino.dart';

class WorkoutExcerciseDetails extends StatelessWidget {
  const WorkoutExcerciseDetails(
      {super.key,
      required this.title,
      required this.minutes,
      required this.numOfExcercises});
  final String title;
  final int minutes;
  final int numOfExcercises;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StylesManager.bold18.copyWith(color: ColorManager.black),
        ),
        Text(
          '$minutes MIN • $numOfExcercises Excercises',
          style: StylesManager.regular12.copyWith(color: ColorManager.black),
        ),
      ],
    );
  }
}
