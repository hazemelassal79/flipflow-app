import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';

class AgePickerWidget extends StatefulWidget {
  const AgePickerWidget({super.key, required this.onChanged, this.value});

  final Function(int value) onChanged;
  final int? value;

  @override
  State<AgePickerWidget> createState() => _AgePickerWidgetState();
}

class _AgePickerWidgetState extends State<AgePickerWidget> {
  int value = 15;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.selectYourAge,
              style: StylesManager.bold16,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            NumberPicker(
              minValue: 10,
              maxValue: 40,
              textStyle: StylesManager.bold16
                  .copyWith(color: ColorManager.primary.withOpacity(0.6)),
              selectedTextStyle: StylesManager.bold18,
              value: widget.value ?? value,
              onChanged: (value) {
                setState(() {
                  setState(() {
                    widget.onChanged(value);
                    this.value = widget.value ?? value;
                  });
                });
              },
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            CustomButtonWidget(
                buttonText: AppStrings.done,
                onPressed: () {
                  GoRouter.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
