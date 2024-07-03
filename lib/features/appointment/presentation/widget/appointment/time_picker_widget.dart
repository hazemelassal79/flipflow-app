import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTimePickerWidget extends StatelessWidget {
  const CustomTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final appointmentCubit = context.read<AppointmentCubit>();
        final centersCubit = context.read<CentersCubit>();
        return Wrap(
          spacing: AppSize.s8,
          runSpacing: AppSize.s12,
          children: List.generate(
              _getTimes(centersCubit, appointmentCubit).length, (index) {
            return GestureDetector(
              onTap: () {
                appointmentCubit.changeSelectedTimeIndex(
                    index, _getTimes(centersCubit, appointmentCubit));
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14, vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                      color: appointmentCubit.selectedTimeIndex == index
                          ? ColorManager.white
                          : ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      border: Border.all(
                          color: appointmentCubit.selectedTimeIndex == index
                              ? ColorManager.black
                              : ColorManager.white)),
                  child: Text(
                    _getTimes(centersCubit, appointmentCubit)[index],
                    style: StylesManager.medium14.copyWith(
                        color: appointmentCubit.selectedTimeIndex == index
                            ? ColorManager.black
                            : ColorManager.white),
                  )),
            );
          }),
        );
      },
    );
  }

  List<String> _getTimes(
      CentersCubit centersCubit, AppointmentCubit appointmentCubit) {
    final schedule = centersCubit.currentCenterEntity?.schedule;
    final days = schedule?.where((element) =>
        element.coachId == centersCubit.currentCoach.uid &&
        (appointmentCubit.trainingDate
                ?.toLowerCase()
                .contains(element.day.toLowerCase()) ??
            false));
    final times = days?.map((e) => e.time).toList();
    return times ?? [];
  }
}
