import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/appointment_details/appointment_details_view_body.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/user_settings/presentation/widgets/custom_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is CreatePaymentKeySuccessState) {
          GoRouter.of(context).push(Routes.paymobWebViewRoute);
        }

        if (state is CancelAppointmentSuccessState) {
          final homeCubit = context.read<HomeCubit>();
          homeCubit.getUserAppointments();
          GoRouter.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => const Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSuccessWidget(text: AppStrings.appointmentCancelled),
                ],
              ),
            ),
          );
        }

        if (state is CancelAppointmentErrorState) {
          showSnackBar(context, text: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.appointmentDetails,
            style: StylesManager.bold20,
          ),
          leading: const CustomBackArrow(),
        ),
        body:
            const CustomGradiantContainer(child: AppointmentDetailsViewBody()),
      ),
    );
  }
}
