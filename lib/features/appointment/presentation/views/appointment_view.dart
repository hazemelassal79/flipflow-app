import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment/appointment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return const AppointmentViewBody();
      },
    );
  }
}
