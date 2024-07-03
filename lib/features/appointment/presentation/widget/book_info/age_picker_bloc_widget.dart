import 'dart:developer';

import 'package:flipflow_app/core/widgets/age_picker_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgePickerBlocWidget extends StatelessWidget {
  const AgePickerBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return AgePickerWidget(
          value: cubit.traineeAgeValue,
          onChanged: (value) {
            log(value.toString());
            cubit.changeTraineeAge(value);
          },
        );
      },
    );
  }
}
