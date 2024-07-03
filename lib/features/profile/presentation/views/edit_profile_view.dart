import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/profile/presentation/widgets/edit_profile/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackArrow(),
        title: Text(
          AppStrings.editProfile,
          style: StylesManager.bold20,
        ),
      ),
      body: const CustomGradiantContainer(
        child: EditProfileViewBody(),
      ),
    );
  }
}
