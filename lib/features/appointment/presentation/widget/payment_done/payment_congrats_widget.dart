import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/res/strings_manager.dart';

class PaymentCongratsWidget extends StatelessWidget {
  const PaymentCongratsWidget({super.key});

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
          child: const Icon(
            Icons.check,
            size: AppSize.s60,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: AppSize.s16),
        Text(
          AppStrings.paymentCompleted,
          style: StylesManager.bold20,
        ),
        const SizedBox(height: AppSize.s12),
        Text(
          AppStrings.paymentCompletedSubtitle,
          textAlign: TextAlign.center,
          style: StylesManager.regular14.copyWith(color: ColorManager.black),
        ),
      ],
    );
  }
}
