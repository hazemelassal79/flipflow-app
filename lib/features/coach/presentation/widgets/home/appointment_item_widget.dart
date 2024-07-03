import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/appointment_details_dialog.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/trainee_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentItemWidget extends StatelessWidget {
  const AppointmentItemWidget({super.key, required this.entity});

  final AppointmentEntity entity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CoachCubit>();
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: Dialog(
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: AppointmentDialogView(
                    appointmentEntity: entity,
                  )),
            );
          },
        );
      },
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(AppSize.s12),
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Row(
            children: [
              CustomCircledImage(
                  imageUrl: entity.trainee!.imageUrl, radius: AppSize.s40),
              const SizedBox(width: AppSize.s12),
              Expanded(
                child: TraineeInfoWidget(
                  entity: entity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
