import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/location_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademyDetails extends StatelessWidget {
  const AcademyDetails({super.key, this.isDark = false});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Academy : ',
                  style: StylesManager.regular14
                      .copyWith(color: ColorManager.black),
                  children: [
                    TextSpan(
                      text: cubit.appointmentEntity!.center!.name,
                      style: StylesManager.regular14.copyWith(
                          color: isDark
                              ? ColorManager.white
                              : ColorManager.primary),
                    )
                  ]),
            ),
            const SizedBox(height: AppSize.s8),
            RichText(
              text: TextSpan(
                  text: 'Gymnastic type : ',
                  style: StylesManager.regular14
                      .copyWith(color: ColorManager.black),
                  children: [
                    TextSpan(
                      text: cubit.appointmentEntity!.gymnasticType!.name,
                      style: StylesManager.regular14.copyWith(
                          color: isDark
                              ? ColorManager.white
                              : ColorManager.primary),
                    )
                  ]),
            ),
            const SizedBox(height: AppSize.s8),
            LocationButtonWidget(
                locationEntity: cubit.appointmentEntity!.center!.location,
                color: isDark ? null : ColorManager.primary),
          ],
        );
      },
    );
  }
}
