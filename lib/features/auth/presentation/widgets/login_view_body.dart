import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/core/widgets/password_suffix_icon.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/coach_user_checker_widget.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/custom_header_image.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/custom_welcome_widget.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/forget_password_button.dart';
import 'package:flipflow_app/features/auth/presentation/widgets/toggle_auth_screens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16, horizontal: AppPadding.p28),
      child: Form(
        key: _formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignInErrorState) {
              showSnackBar(context, text: state.message);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomHeaderImage(),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const CoachUserCheckerWidget(),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  const CustomWelcomeWidget(
                      title: AppStrings.welcomeBack,
                      subTitle: AppStrings.loginToYourAccount),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: StylesManager.regular16,
                    validator: (value) {
                      if (!value.isValidEmail()) {
                        return AppStrings.emailErrorText;
                      }
                      return null;
                    },
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
                    style: StylesManager.regular16,
                    obscureText: cubit.isShownPassword,
                    validator: (value) {
                      if (!value.isValidPassword()) {
                        return AppStrings.passwordErrorText;
                      }
                      return null;
                    },
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
                  const ForgetPasswordButton(),
                  _changeButtonWidget(state, cubit),
                  ToggleAuthScreensWidget(
                    descriptionText: AppStrings.doNotHaveAnAccount,
                    buttonText: AppStrings.signUp,
                    onButtonPressed: () {
                      GoRouter.of(context).push(Routes.registerRoute);
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _changeButtonWidget(AuthState state, AuthCubit cubit) {
    if (state is SignInLoadingState) {
      return const CustomLoadingWidget();
    } else {
      return CustomButtonWidget(
        buttonText: AppStrings.signIn,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (cubit.isTrainee) {
              cubit.signIn(
                email: _emailController.text.trim(),
                password: _passwordController.text,
                onDone: () {
                  GoRouter.of(context).pushReplacement(Routes.homeRoute);
                },
              );
            } else {
              cubit.coachSignIn(
                email: _emailController.text.trim(),
                password: _passwordController.text,
                onDone: () {
                  GoRouter.of(context).pushReplacement(Routes.coachLayoutRoute);
                },
              );
            }
          }
          
          // logIn(cubit);
        },
      );
    }
  }




  // logIn(AuthCubit cubit) {

  // }
}
