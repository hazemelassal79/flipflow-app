import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/centers/presentation/custom_item_container.dart';
import 'package:flutter/material.dart';

class CoachItemWidget extends StatelessWidget {
  const CoachItemWidget({
    super.key,
    required this.coach,
    this.onTap,
  });

  final CoachEntity coach;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomItemContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCircledImage(imageUrl: coach.imageUrl, radius: AppSize.s30),
            const SizedBox(
              width: AppSize.s18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(coach.name, style: StylesManager.semiBold18),
                  Text("${coach.experience} years of experience",
                      style: StylesManager.regular12
                          .copyWith(color: ColorManager.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
