import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class PaymentStatusWidget extends StatelessWidget {
  const PaymentStatusWidget({super.key, required this.isPaymentDone});

  final bool isPaymentDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.s120,
          width: AppSize.s120,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Icon(
            isPaymentDone ? Icons.check : Icons.warning_amber_rounded,
            size: AppSize.s60,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: AppSize.s14),
        Text(isPaymentDone ? "Payment Done" : "Payment Pending",
            style: StylesManager.bold20),
      ],
    );
  }
}
