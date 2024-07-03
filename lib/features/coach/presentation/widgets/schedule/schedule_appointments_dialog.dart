import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/schedule/schedule_appointment_widget.dart';
import 'package:flutter/material.dart';

class ScheduleAppointmentsDialog extends StatelessWidget {
  const ScheduleAppointmentsDialog({super.key, required this.appointments});

  final List<AppointmentEntity> appointments;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
      ),
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppPadding.p16),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: ScheduleAppointmentWidget(
                appointment: appointments[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: AppSize.s8,
            );
          },
          itemCount: appointments.length),
    );
  }
}
