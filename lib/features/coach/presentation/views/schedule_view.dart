import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/schedule/schedule_view_body.dart';
import 'package:flutter/material.dart';

class CoachScheduleView extends StatelessWidget {
  const CoachScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppStrings.schedule,
              style: StylesManager.bold24,
            )),
        body: const CustomGradiantContainer(child: CoachScheduleViewBody()));
  }
}
