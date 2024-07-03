import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/profile/edit_coach_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCoachProfileView extends StatelessWidget {
  const EditCoachProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  CustomBackArrow(
          onNavigation: () {
            context.read<CoachCubit>().clearImage();
          },
        ),
        title: Text(
          AppStrings.editProfile,
          style: StylesManager.bold20,
        ),
      ),
      body: const CustomGradiantContainer(
        child: EditCoachProfileViewBody(),
      ),
    );
  }
}
