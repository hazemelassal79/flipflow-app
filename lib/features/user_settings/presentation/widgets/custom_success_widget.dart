import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({super.key, required this.text});
  final String text;
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
            Lottie.asset(AssetsManager.successJson,
                height: AppSize.s100, width: AppSize.s100),
            const SizedBox(
              height: AppSize.s14,
            ),
            Text(
              text,
              style: StylesManager.medium18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            SizedBox(
              width: 200,
              height: AppSize.s40,
              child: ElevatedButton(
                onPressed: () => GoRouter.of(context).pop(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary),
                child: Text(
                  AppStrings.ok,
                  style: StylesManager.semiBold16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
