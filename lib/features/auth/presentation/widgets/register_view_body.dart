import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/core/widgets/password_suffix_icon.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/age_picker_authbloc_widget.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/custom_header_image.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/custom_welcome_widget.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/toggle_auth_screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p28, horizontal: AppPadding.p28),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: CustomHeaderImage()),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const CustomWelcomeWidget(
                      title: AppStrings.welcomeToApp,
                      subTitle: AppStrings.createAccount),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    style: StylesManager.regular16,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.fieldRequiredError;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: CustomFormFieldIcon(
                        svgImagepath: AssetsManager.profileIcon,
                      ),
                      hintText: AppStrings.username,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (!value.isValidEmail()) {
                        return AppStrings.emailErrorText;
                      }
                      return null;
                    },
                    style: StylesManager.regular16,
                    decoration: const InputDecoration(
                      prefixIcon: CustomFormFieldIcon(
                        svgImagepath: AssetsManager.emailIcon,
                      ),
                      hintText: AppStrings.email,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: cubit.isShownPassword,
                    validator: (value) {
                      if (!value.isValidPassword()) {
                        return AppStrings.passwordErrorText;
                      }
                      return null;
                    },
                    style: StylesManager.regular16,
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      prefixIcon: const CustomFormFieldIcon(
                        svgImagepath: AssetsManager.passwordIcon,
                      ),
                      suffixIcon: CustomPasswordSuffixIcon(
                        value: cubit.isShownPassword,
                        onTap: () {
                          cubit.setPasswordVisibility();
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
                    obscureText: cubit.isShownPassword,
                    validator: (value) {
                      if ((value != _passwordController.text)) {
                        return AppStrings.confirmPasswordErrorText;
                      }
                      return null;
                    },
                    style: StylesManager.regular16,
                    decoration: InputDecoration(
                      suffixIcon: CustomPasswordSuffixIcon(
                        value: cubit.isShownPassword,
                        onTap: () {
                          cubit.setPasswordVisibility();
                        },
                      ),
                      prefixIcon: const CustomFormFieldIcon(
                        svgImagepath: AssetsManager.passwordIcon,
                      ),
                      hintText: AppStrings.confirmPassword,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        buttonText: AppStrings.selectAge,
                        style: StylesManager.medium14
                            .copyWith(color: ColorManager.primary),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const AgePickerDialogWidget());
                        },
                      ),
                      Visibility(
                        visible: cubit.age != null,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(AppSize.s8)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8,
                              vertical: AppPadding.p8),
                          child: Text(
                            cubit.age.toString(),
                            style: StylesManager.medium18
                                .copyWith(color: ColorManager.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  _changeButtonWidget(state, cubit),
                  ToggleAuthScreensWidget(
                    descriptionText: AppStrings.alreadyHaveAccount,
                    buttonText: AppStrings.signIn,
                    onButtonPressed: () {
                      GoRouter.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _changeButtonWidget(AuthState state, AuthCubit cubit) {
    if (state is RegisterLoadingState) {
      return const CustomLoadingWidget();
    } else {
      return CustomButtonWidget(
        buttonText: AppStrings.signUp,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (cubit.age == null) {
              showSnackBar(context, text: AppStrings.selectAgeError);
              return;
            }
            cubit.register(
              email: _emailController.text.trim(),
              username: _usernameController.text.trim(),
              password: _passwordController.text,
              onDone: () {
                while (GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                }
                GoRouter.of(context).pushReplacement(Routes.homeRoute);
              },
            );
          }
        },
      );
    }
  }
}
