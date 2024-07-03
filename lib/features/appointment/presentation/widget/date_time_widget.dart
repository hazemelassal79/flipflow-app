import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDateTimeWidget extends StatefulWidget {
  const AppointmentDateTimeWidget({super.key, this.isDark = false});

  final bool isDark;

  @override
  State<AppointmentDateTimeWidget> createState() =>
      _AppointmentDateTimeWidgetState();
}

class _AppointmentDateTimeWidgetState extends State<AppointmentDateTimeWidget> {
  late final DateTime date;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AppointmentCubit>();
    date = cubit.appointmentEntity!.trainingTime.toDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: '${AppStrings.date} : ',
                  style: StylesManager.regular14
                      .copyWith(color: ColorManager.black),
                  children: [
                    TextSpan(
                      text: date.toFormattedDate(),
                      style: StylesManager.regular14.copyWith(
                          color: widget.isDark
                              ? ColorManager.white
                              : ColorManager.primary),
                    )
                  ]),
            ),
            const SizedBox(height: AppSize.s12),
            RichText(
              text: TextSpan(
                  text: '${AppStrings.time} : ',
                  style: StylesManager.regular14
                      .copyWith(color: ColorManager.black),
                  children: [
                    TextSpan(
                      text: date.toFormattedTime(),
                      style: StylesManager.regular14.copyWith(
                          color: widget.isDark
                              ? ColorManager.white
                              : ColorManager.primary),
                    )
                  ]),
            ),
          ],
        );
      },
    );
  }
}
