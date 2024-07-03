import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/academy_details.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/date_time_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/payment/estimated_cost_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/trainer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is CreatePaymentKeyErrorState) {
            showSnackBar(context, text: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AppointmentCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.appointmentDetails, style: StylesManager.bold20),
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
              const Divider(
                color: ColorManager.grey,
                height: AppSize.s30,
              ),
              const SizedBox(
                height: AppSize.s45,
              ),
              if (state is CreatePaymentKeyLoadingState) ...[
                const Center(child: CircularProgressIndicator())
              ] else ...[
                CustomButtonWidget(
                  buttonText: AppStrings.confirm,
                  onPressed: () async {
                    if (cubit.paymentKey == null) {
                      await cubit.createPaymentKey(
                          price: int.parse(cubit.appointmentEntity!
                              .gymnasticType!.appointmentPrice));
                    }
                    if (context.mounted && cubit.paymentKey != null) {
                      GoRouter.of(context).push(Routes.paymobWebViewRoute);
                    }
                  },
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
