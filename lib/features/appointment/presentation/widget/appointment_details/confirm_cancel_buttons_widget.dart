import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCancelButtonWidget extends StatelessWidget {
  const ConfirmCancelButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        if (state is CreatePaymentKeyLoadingState ||
            state is CancelAppointmentLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Row(children: [
          Expanded(
            child: CustomButtonWidget(
              buttonText: AppStrings.cancel,
              onPressed: () async {
                await cubit.cancelAppointment();
              },
            ),
          ),
          Visibility(
              visible: cubit.appointmentEntity!.paymentStatus == "Pending",
              child: const SizedBox(width: AppSize.s16)),
          Visibility(
            visible: cubit.appointmentEntity!.paymentStatus == "Pending",
            child: Expanded(
              child: CustomButtonWidget(
                buttonText: AppStrings.confirm,
                onPressed: () {
                  cubit.createPaymentKey(
                      price: int.parse(cubit
                          .appointmentEntity!.gymnasticType!.appointmentPrice));
                },
              ),
            ),
          )
        ]);
      },
    );
  }
}
