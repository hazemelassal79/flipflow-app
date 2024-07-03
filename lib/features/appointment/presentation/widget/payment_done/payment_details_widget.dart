import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/academy_details.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/date_time_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/trainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p18, vertical: AppPadding.p16),
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrainerWidget(
                isDark: true,
              ),
              Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              AcademyDetails(isDark: true),
              Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              AppointmentDateTimeWidget(
                isDark: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
