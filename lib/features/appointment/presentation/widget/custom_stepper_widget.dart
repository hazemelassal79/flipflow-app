import 'dart:developer';

import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

class CustomStepperWidget extends StatelessWidget {
  const CustomStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          final cubit = context.read<AppointmentCubit>();
          return NumberStepper(
            lineLength: (constraints.maxWidth - 96) * 0.4,
            enableStepTapping: false,
            activeStep: cubit.stepperIndex,
            onStepReached: (index) {
              log('onStepReached: $index');
            },
            steppingEnabled: true,
            activeStepColor: ColorManager.primary,
            stepColor: ColorManager.lightGrey,
            scrollingDisabled: true,
            lineColor: ColorManager.black,
            lineDotRadius: 0.16,
            stepPadding: 0,
            activeStepBorderPadding: 0,
            enableNextPreviousButtons: false,
            stepRadius: AppSize.s16,
            numberStyle:
                StylesManager.medium18.copyWith(color: ColorManager.white),
            numbers: const [1, 2, 3],
          );
        },
      );
    });
  }
}
