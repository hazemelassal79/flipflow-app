import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/coach_item_widget.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment/select_datetime_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentViewBody extends StatefulWidget {
  const AppointmentViewBody({super.key});

  @override
  State<AppointmentViewBody> createState() => _AppointmentViewBodyState();
}

class _AppointmentViewBodyState extends State<AppointmentViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        final centerCubit = context.read<CentersCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
          child: Column(
            children: [
              CoachItemWidget(coach: centerCubit.currentCoach),
              const SizedBox(
                height: AppSize.s18,
              ),
              const SelectDateTimeWidget(),
              const SizedBox(height: AppSize.s20),
              CustomButtonWidget(
                  buttonText: AppStrings.next,
                  onPressed: () {
                    if (cubit.trainingDate == null) {
                      showSnackBar(context, text: AppStrings.dateError);
                      return;
                    }
                    if (cubit.trainingTime == null) {
                      showSnackBar(context, text: AppStrings.timeError);
                      return;
                    }
                    cubit.changeStepper();
                  }),
            ],
          ),
        );
      },
    );
  }
}
