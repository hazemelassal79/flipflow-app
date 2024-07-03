
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/schedule/schedule_appointment_widget.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/schedule/schedule_appointments_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CoachScheduleViewBody extends StatelessWidget {
  const CoachScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      builder: (context, state) {
        final cubit = context.read<CoachCubit>();
        return SfCalendar(
          view: CalendarView.day,
          timeZone: UiConstants.defaultTimeZone,
          showCurrentTimeIndicator: false,
          timeSlotViewSettings: TimeSlotViewSettings(
            timeTextStyle: StylesManager.medium18,
            timeIntervalHeight: AppSize.s30,
            timeFormat: UiConstants.defaultTimeFormat,
            timeInterval: const Duration(
              minutes: UiConstants.defaultTimeInterval,
            ),
            startHour: UiConstants.defaultStartHour,
            endHour: UiConstants.defaultEndHour,
          ),
          dataSource: AppointmentDataSource(cubit.scheduleAppointments),
          appointmentBuilder: (context, calendarAppointmentDetails) {
            for (var element in calendarAppointmentDetails.appointments) {
              final appointments =
                  element.resourceIds as List<AppointmentEntity>;
              return ScheduleAppointmentWidget(
                appointment: appointments.first,
                onSeeAllButtonPressed: appointments.length > 1
                    ? () => _showAppointmentsDialog(context, appointments)
                    : null,
              );
            }
            return Container();
          },
          todayTextStyle: StylesManager.semiBold24,
          allowAppointmentResize: true,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 7)),
          headerStyle: CalendarHeaderStyle(
              backgroundColor: Colors.transparent,
              textStyle: StylesManager.bold20),
        );
      },
    );
  }
}

void _showAppointmentsDialog(
    BuildContext context, List<AppointmentEntity> appointments) {
  showDialog(
    context: context,
    builder: (context) {
      return ScheduleAppointmentsDialog(appointments: appointments);
    },
  );
}

class AppointmentDataSource extends CalendarDataSource<AppointmentEntity> {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
