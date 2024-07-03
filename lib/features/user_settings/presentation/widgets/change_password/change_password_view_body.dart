import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flipflow_app/core/widgets/password_suffix_icon.dart';
import 'package:flipflow_app/core/widgets/profile_image_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/widgets/dialog_widget.dart';
import 'package:flipflow_app/features/user_settings/presentation/cubit/user_settings_cubit.dart';
import 'package:flipflow_app/features/user_settings/presentation/widgets/custom_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSettingsCubit, UserSettingsState>(
      listener: (context, state) {
        if (state is ChangePasswordErrorState) {
          showDialog(
              context: context,
              builder: (context) => CustomDialogWidget(
                    child: CustomErrorWidget(
                      text: state.message,
                      buttonText: AppStrings.ok,
                      onButtonPressed: () => GoRouter.of(context).pop(),
                    ),
                  ));
        }

        if (state is ChangePasswordSuccessState) {
          showDialog(
              context: context,
              builder: (context) => CustomDialogWidget(
                    child: CustomSuccessWidget(
                      text: state.message,
                    ),
                  ));
        }
      },
      builder: (context, state) {
        final cubit = context.read<UserSettingsCubit>();
        ProfileCubit? profileCubit;
        CoachCubit? coachCubit;
        if (cubit.isCoach) {
          coachCubit = context.read<CoachCubit>();
        } else {
          profileCubit = context.read<ProfileCubit>();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16, horizontal: AppPadding.p20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ProfileImageWidget(
                          imageUrl: cubit.isCoach
                              ? coachCubit!.coachEntity!.imageUrl
                              : profileCubit!.user!.imageUrl,
                          image: null),
                      const SizedBox(height: AppSize.s20),
                      Text(
                          cubit.isCoach
                              ? coachCubit!.coachEntity!.name
                              : profileCubit!.user!.username,
                          style: StylesManager.bold24),
                      const SizedBox(height: AppSize.s40),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: cubit.isPasswordVisible,
                        validator: (value) {
                          if (!value.isValidPassword()) {
                            return AppStrings.passwordErrorText;
                          }
                          return null;
                        },
                        style: StylesManager.regular16,
                        decoration: InputDecoration(
                          errorMaxLines: 2,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8,
                              vertical: AppPadding.p8),
                          prefixIcon: const CustomFormFieldIcon(
                            svgImagepath: AssetsManager.passwordIcon,
                          ),
                          suffixIcon: CustomPasswordSuffixIcon(
                            value: cubit.isPasswordVisible,
                            onTap: () {
                              cubit.changePasswordVisibility();
                            },
                          ),
                          hintText: AppStrings.password,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: cubit.isPasswordVisible,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return AppStrings.confirmPasswordErrorText;
                          }
                          return null;
                        },
                        style: StylesManager.regular16,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8,
                              vertical: AppPadding.p8),
                          suffixIcon: CustomPasswordSuffixIcon(
                            value: cubit.isPasswordVisible,
                            onTap: () {
                              cubit.changePasswordVisibility();
                            },
                          ),
                          prefixIcon: const CustomFormFieldIcon(
                            svgImagepath: AssetsManager.passwordIcon,
                          ),
                          hintText: AppStrings.confirmPassword,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: (state is ChangePasswordLoadingState)
                        ? const CircularProgressIndicator()
                        : CustomButtonWidget(
                            buttonText: AppStrings.save,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.updatePassword(_passwordController.text);
                              }
                            },
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
