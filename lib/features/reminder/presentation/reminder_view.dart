import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/reminder/presentation/cubit/reminder_cubit.dart';
import 'package:flipflow_app/features/reminder/presentation/widgets/reminder_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.get<ReminderCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackArrow(),
          title: Text(
            AppStrings.reminder,
            style: StylesManager.bold20,
          ),
        ),
        body: const CustomGradiantContainer(
          child: ReminderViewBody(),
        ),
      ),
    );
  }
}
