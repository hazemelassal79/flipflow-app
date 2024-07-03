import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/forget_password/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackArrow(),
        title: Text(
          AppStrings.forgotPassword,
          style: StylesManager.semiBold18.copyWith(color: ColorManager.black),
        ),
      ),
      body: const CustomGradiantContainer(
        child: ForgetPasswordViewBody(),
      ),
    );
  }
}
