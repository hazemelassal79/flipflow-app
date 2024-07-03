import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/views/appointment_view.dart';
import 'package:flipflow_app/features/appointment/presentation/views/book_info_view.dart';
import 'package:flipflow_app/features/appointment/presentation/views/payment_view.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/custom_stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppointmentLayout extends StatelessWidget {
  const AppointmentLayout({super.key});

  final appBarTitles = const [
    AppStrings.appointment,
    AppStrings.bookAppointment,
    AppStrings.payment,
  ];

  final screens = const [
    AppointmentView(),
    BookInfoView(),
    PaymentView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: CustomBackArrow(
              onTab: () {
                if (cubit.stepperIndex == 1) {
                  cubit.changeStepper(isBack: true);
                } else {
                  GoRouter.of(context).pop();
                  cubit.clear();
                }
              },
            ),
            title: Text(
              appBarTitles[cubit.stepperIndex],
              style: StylesManager.bold20,
            ),
          ),
          body: CustomGradiantContainer(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Column(
                  children: [
                    const CustomStepperWidget(),
                    screens[cubit.stepperIndex],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
