import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/academy_details.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment_details/confirm_cancel_buttons_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment_details/trainee_data_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/date_time_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment/estimated_cost_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/trainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDetailsViewBody extends StatelessWidget {
  const AppointmentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppointmentTraineeWidget(
                    name: cubit.appointmentEntity!.trainee!.name,
                    imageUrl: cubit.appointmentEntity!.trainee!.imageUrl),
              ),
              const Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              const TrainerWidget(),
              const Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              const AcademyDetails(),
              const Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              const AppointmentDateTimeWidget(),
              const Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              EstimatedCostWidget(
                cost: cubit.appointmentEntity!.gymnasticType!.appointmentPrice,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              const ConfirmCancelButtonWidget(),
            ],
          ),
        );
      },
    );
  }
}
