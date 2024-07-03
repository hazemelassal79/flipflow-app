import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key,
      required this.text,
      this.onButtonPressed,
      this.buttonText = AppStrings.tryAgain});
  final String text;
  final String buttonText;
  final Function()? onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(AssetsManager.errorJson,
                height: AppSize.s100, width: AppSize.s100),
            Text(
              text,
              style: StylesManager.medium18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppPadding.p16,
            ),
            Visibility(
              visible: onButtonPressed != null,
              child: SizedBox(
                width: 200,
                height: AppSize.s40,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary),
                  child: Text(
                    buttonText,
                    style: StylesManager.semiBold16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
