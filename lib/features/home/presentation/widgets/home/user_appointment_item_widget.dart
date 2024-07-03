import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/location_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAppointmentItemWidget extends StatefulWidget {
  const UserAppointmentItemWidget({
    super.key,
    required this.entity,
  });

  final AppointmentEntity entity;

  @override
  State<UserAppointmentItemWidget> createState() =>
      _UserAppointmentItemWidgetState();
}

class _UserAppointmentItemWidgetState extends State<UserAppointmentItemWidget> {
  late final int _daysLeft;
  late final String _time;

  @override
  void initState() {
    super.initState();
    _daysLeft = _getDaysLeft();
    final date = widget.entity.trainingTime.toDateTime();
    _time = date.toFormattedTime();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Routes.appointmentDetailsRoute, extra: widget.entity);
      },
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          child: Card(
            elevation: 4,
            shadowColor: ColorManager.lightGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            color: ColorManager.primary,
            child: Padding(
              padding:  const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  CustomCircledImage(
                      imageUrl: widget.entity.trainee!.imageUrl,
                      radius: AppSize.s30),
                  const SizedBox(width: AppSize.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.entity.trainee!.name,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: StylesManager.semiBold16
                              .copyWith(color: ColorManager.white),
                        ),
                        Text(
                          _daysLeft == 0
                              ? 'Today at $_time'
                              : 'After $_daysLeft days at $_time',
                          style: StylesManager.regular14
                              .copyWith(color: ColorManager.white),
                        ),
                        LocationButtonWidget(
                            locationEntity: widget.entity.center!.location)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _getDaysLeft() {
    return widget.entity.trainingTime
        .toDateTime()
        .difference(DateTime.now())
        .inDays;
  }
}
