import 'package:flutter/material.dart';
import 'package:flipflow_app/features/reminder/presentation/widgets/custom_radio_button.dart';

class RepeatWidget extends StatefulWidget {
  final Function(String repeatOption) onChanged;

  const RepeatWidget({super.key, required this.onChanged});

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  String? repeatOption;

  final List<String> daysLists = [
    "Everyday",
    "Mon-Fri",
    "Weekends",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: daysLists
          .map((day) => RadioItemWidget(
                value: day,
                label: day,
                groupValue: repeatOption,
                onChanged: (data) {
                  setState(() {
                    repeatOption = data; // Update the selected option
                  });
                  widget.onChanged(repeatOption.toString());
                },
              ))
          .toList(),
    );
  }
}
