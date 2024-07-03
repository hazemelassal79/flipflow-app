import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/cupertino.dart';

class NewWorkoutDetailsWidget extends StatelessWidget {
  const NewWorkoutDetailsWidget(
      {super.key,
      required this.exerciseName,
      required this.exerciseTime,
      required this.exercisesNumber});

  final String exerciseName;
  final String exerciseTime;
  final String exercisesNumber;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: AppPadding.p20,
        left: AppPadding.p22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exerciseName,
              style: StylesManager.bold18.copyWith(color: ColorManager.white),
            ),
            Text('$exerciseTime MIN • $exercisesNumber EXERCISES',
                style: StylesManager.medium14.copyWith(color: ColorManager.white))
          ],
        ));
  }
}
