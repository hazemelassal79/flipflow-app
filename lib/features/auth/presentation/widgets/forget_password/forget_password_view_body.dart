import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is EmailSentErrorState) {
          showSnackBar(context, text: state.message);
        }

        if (state is EmailSentSuccessState) {
          showSnackBar(context,
              text: state.message, color: ColorManager.primary);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.passwordReset,
                      style: StylesManager.semiBold18
                          .copyWith(color: ColorManager.black)),
                  const SizedBox(
                    height: AppSize.s30,
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
                    height: AppSize.s40,
                  ),
                  CustomButtonWidget(
                    buttonText: AppStrings.sendVerification,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.sendPasswordResetMail(
                            email: _emailController.text.trim());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
