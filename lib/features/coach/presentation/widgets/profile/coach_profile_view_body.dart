import 'dart:developer';

import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/action_item_button.dart';
import 'package:flipflow_app/core/widgets/profile_image_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/user_settings/presentation/cubit/user_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CoachProfileViewBody extends StatelessWidget {
  const CoachProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserSettingsCubit, UserSettingsState>(
      listener: (context, state) {
        log('message');
        if (state is UserSignOutSuccessState) {
          while (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
          GoRouter.of(context).pushReplacement(Routes.loginRoute);
        }
      },
      child: BlocConsumer<CoachCubit, CoachState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<CoachCubit>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImageWidget(
                imageUrl: cubit.coachEntity!.imageUrl,
                image: cubit.image,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              ActionItemButton(
                buttonName: AppStrings.editProfile,
                onPressed: () {
                  GoRouter.of(context).push(Routes.editCoachProfileRoute);
                },
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              ActionItemButton(
                buttonName: AppStrings.logout,
                onPressed: () async {
                  final userSettingsCubit = context.read<UserSettingsCubit>();
                  await userSettingsCubit.signOut();
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          );
        },
      ),
    );
  }
}
