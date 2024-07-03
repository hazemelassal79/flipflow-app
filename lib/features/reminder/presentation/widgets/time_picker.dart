import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/features/reminder/presentation/widgets/time_format_widget.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key, required this.onTimeChanged});

  final Function(String) onTimeChanged;
  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  int hour = DateTime.now().formattedHour;
  int minute = DateTime.now().formattedMinute;
  String timeFormat = DateTime.now().amPm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberPicker(
              minValue: 1,
              maxValue: 12,
              value: hour,
              zeroPad: true,
              infiniteLoop: true,
              onChanged: (value) {
                setState(() {
                  hour = value;
                  widget.onTimeChanged(_getTime());
                });
              },
              textStyle: StylesManager.medium18
                  .copyWith(color: ColorManager.black.withOpacity(0.4)),
              selectedTextStyle: StylesManager.bold18,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: ColorManager.primary,
                    ),
                    bottom: BorderSide(color: ColorManager.primary)),
              ),
            ),
            NumberPicker(
              minValue: 0,
              maxValue: 59,
              value: minute,
              zeroPad: true,
              infiniteLoop: true,
              onChanged: (value) {
                setState(() {
                  minute = value;
                  widget.onTimeChanged(_getTime());
                });
              },
              textStyle: StylesManager.medium18
                  .copyWith(color: ColorManager.black.withOpacity(0.4)),
              selectedTextStyle: StylesManager.bold18,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: ColorManager.primary,
                    ),
                    bottom: BorderSide(color: ColorManager.primary)),
              ),
            ),
            Column(
              children: [
                TimeFormatWidget(
                    onTap: (format) {
                      setState(() {
                        timeFormat = format;
                        widget.onTimeChanged(_getTime());
                      });
                    },
                    format: AppStrings.am,
                    colorCondition: timeFormat == AppStrings.am),
                const SizedBox(
                  height: AppSize.s14,
                ),
                TimeFormatWidget(
                    onTap: (format) {
                      setState(() {
                        timeFormat = format;
                        widget.onTimeChanged(_getTime());
                      });
                    },
                    format: AppStrings.pm,
                    colorCondition: timeFormat == AppStrings.pm),
              ],
            )
          ],
        )
      ],
    );
  }

  String _getTime() {
    final hours = hour < 10 ? "0$hour" : hour.toString();
    final minutes = minute < 10 ? "0$minute" : minute.toString();
    return "$hours:$minutes $timeFormat";
  }
}
