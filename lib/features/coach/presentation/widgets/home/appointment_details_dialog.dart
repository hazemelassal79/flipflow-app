import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/appointment_user_info.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/payment_status_widget.dart';
import 'package:flutter/material.dart';

class AppointmentDialogView extends StatelessWidget {
  const AppointmentDialogView(
      {super.key, required this.appointmentEntity});

  final AppointmentEntity appointmentEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PaymentStatusWidget(
              isPaymentDone:
                  appointmentEntity.paymentStatus == "paid" ? true : false),
          const SizedBox(height: AppSize.s40),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p22),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomCircledImage(
                    imageUrl: UiConstants.defaultUserImage,
                    radius: AppSize.s40),
                const SizedBox(height: AppSize.s14),
                AppointmentUserInfo(
                  entity: appointmentEntity,
                ),
                const Divider(
                  color: ColorManager.white,
                ),
                AppointmentUserInfo(
                  entity: appointmentEntity,
                  isDateTime: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
