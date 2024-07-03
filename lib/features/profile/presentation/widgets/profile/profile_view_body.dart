import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/action_item_button.dart';
import 'package:flipflow_app/core/widgets/profile_image_widget.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flipflow_app/features/user_settings/presentation/cubit/user_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserSettingsCubit, UserSettingsState>(
      listener: (context, state) {
        if (state is UserSignOutSuccessState) {
          while (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
          GoRouter.of(context).pushReplacement(Routes.loginRoute);
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final userSettingsCubit = context.read<UserSettingsCubit>();
          final cubit = context.read<ProfileCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Column(
              children: [
                ProfileImageWidget(
                  imageUrl: cubit.user!.imageUrl,
                  image: null,
                ),
                const SizedBox(height: AppSize.s20),
                Text(cubit.user!.username, style: StylesManager.bold24),
                const Spacer(
                  flex: 1,
                ),
                ActionItemButton(
                  buttonName: AppStrings.editProfile,
                  onPressed: () {
                    GoRouter.of(context).push(Routes.editProfileRoute);
                  },
                ),
                const SizedBox(height: AppSize.s24),
                ActionItemButton(
                  buttonName: AppStrings.reminder,
                  onPressed: () {
                    GoRouter.of(context).push(Routes.reminderRoute);
                  },
                ),
                const SizedBox(height: AppSize.s24),
                ActionItemButton(
                  buttonName: AppStrings.logout,
                  onPressed: () async {
                    await userSettingsCubit.signOut();
                  },
                  icon: const Icon(Icons.logout_rounded),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
