import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flutter/material.dart';

class AppointmentTraineeWidget extends StatelessWidget {
  const AppointmentTraineeWidget({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCircledImage(
          imageUrl: imageUrl,
          radius: AppSize.s80,
        ),
        const SizedBox(height: AppSize.s12),
        Text(
          name,
          style: StylesManager.bold20,
        )
      ],
    );
  }
}
