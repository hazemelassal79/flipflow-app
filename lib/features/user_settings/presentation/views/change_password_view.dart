import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/user_settings/presentation/widgets/change_password/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackArrow(),
        title: Text(
          AppStrings.changePassword,
          style: StylesManager.bold20,
        ),
      ),
      body: const CustomGradiantContainer(
        child: ChangePasswordViewBody(),
      ),
    );
  }
}
