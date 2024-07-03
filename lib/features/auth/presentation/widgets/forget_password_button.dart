import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: TextButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.forgotPassword);
            },
            child: Text(
              AppStrings.forgotPassword,
              style: StylesManager.bold16.copyWith(color: ColorManager.primary),
            )),
      ),
    );
  }
}
