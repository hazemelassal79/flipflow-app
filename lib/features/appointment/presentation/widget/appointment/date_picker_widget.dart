import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePickerWidget extends StatelessWidget {
  const CustomDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final appointmentCubit = context.read<AppointmentCubit>();
        final centerCubit = context.read<CentersCubit>();
        return SfDateRangePicker(
          selectionTextStyle: StylesManager.semiBold12,
          backgroundColor: Colors.transparent,
          maxDate: DateTime.now().add(const Duration(days: 30)),
          minDate: DateTime.now(),
          initialSelectedDate: appointmentCubit.trainingDate?.toDateTime(),
          headerHeight: AppSize.s60,
          selectionColor: ColorManager.white,
          monthViewSettings: DateRangePickerMonthViewSettings(
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: StylesManager.regular14.copyWith(
              color: ColorManager.black,
            ),
          )),
          todayHighlightColor: null,
          headerStyle: DateRangePickerHeaderStyle(
              backgroundColor: Colors.transparent,
              textStyle: StylesManager.bold16,
              textAlign: TextAlign.center),
          yearCellStyle: DateRangePickerYearCellStyle(
              textStyle:
                  StylesManager.medium18.copyWith(color: ColorManager.white),
              disabledDatesTextStyle: StylesManager.medium18.copyWith(
                  color: ColorManager.black,
                  decoration: TextDecoration.lineThrough),
              todayTextStyle:
                  StylesManager.medium18.copyWith(color: ColorManager.white)),
          monthCellStyle: DateRangePickerMonthCellStyle(
              leadingDatesTextStyle: StylesManager.bold16,
              blackoutDateTextStyle: StylesManager.bold16,
              todayCellDecoration: const BoxDecoration(color: null),
              todayTextStyle: StylesManager.medium12,
              textStyle:
                  StylesManager.semiBold12.copyWith(color: ColorManager.white),
              disabledDatesTextStyle:
                  StylesManager.semiBold12.copyWith(color: ColorManager.black)),
          selectableDayPredicate: (date) =>
              _getSelectedDates(centerCubit, appointmentCubit)
                  .contains(date.weekday),
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            appointmentCubit.setTrainingDate(DateFormat.yMMMEd()
                .format(dateRangePickerSelectionChangedArgs.value));
          },
        );
      },
    );
  }

  List<int> _getSelectedDates(
      CentersCubit centersCubit, AppointmentCubit appointmentCubit) {
    final schedule = centersCubit.currentCenterEntity?.schedule;
    final coachDays = schedule
        ?.where((element) => element.coachId == centersCubit.currentCoach.uid)
        .toList();
    final daysValues = coachDays?.map((e) => parseDayOfWeek(e.day)).toList();

    return daysValues?.map((e) => e.dateTimeValue).toList() ?? [];
  }
}
