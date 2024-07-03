import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordEmailButtons extends StatelessWidget {
  const ChangePasswordEmailButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButton(
          onPressed: () {
            GoRouter.of(context).push(Routes.changePasswordRoute);
          },
          buttonText: AppStrings.changePassword,
          style: StylesManager.medium14,
        ),
        CustomTextButton(
          onPressed: () {
            GoRouter.of(context).push(Routes.changeEmailRoute);
          },
          buttonText: AppStrings.changeEmail,
          style: StylesManager.medium14,
        ),
      ],
    );
  }
}
