import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainerWidget extends StatelessWidget {
  const TrainerWidget({super.key, this.isDark = false});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCircledImage(
                imageUrl: cubit.appointmentEntity!.coach!.imageUrl,
                radius: AppSize.s30),
            const SizedBox(width: AppSize.s20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cubit.appointmentEntity!.coach!.name,
                    style: StylesManager.bold16),
                RichText(
                  text: TextSpan(
                      text: '${AppStrings.phone} : ',
                      style: StylesManager.regular14
                          .copyWith(color: ColorManager.black),
                      children: [
                        TextSpan(
                          text: cubit.appointmentEntity!.coach!.phoneNumber,
                          style: StylesManager.regular14.copyWith(
                              color: isDark
                                  ? ColorManager.white
                                  : ColorManager.primary),
                        )
                      ]),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
