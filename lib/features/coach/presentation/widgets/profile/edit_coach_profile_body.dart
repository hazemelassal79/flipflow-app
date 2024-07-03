import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/widgets/change_password_email_widget.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/core/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/coach_cubit.dart';

class EditCoachProfileViewBody extends StatefulWidget {
  const EditCoachProfileViewBody({super.key});

  @override
  State<EditCoachProfileViewBody> createState() =>
      _EditCoachProfileViewBodyState();
}

class _EditCoachProfileViewBodyState extends State<EditCoachProfileViewBody> {
  late final TextEditingController _userNameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _userNameController = TextEditingController();
    _phoneController = TextEditingController();
    final cubit = context.read<CoachCubit>();
    _userNameController.text = cubit.coachEntity?.name ?? '';
    _phoneController.text = cubit.coachEntity?.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      builder: (context, state) {
        final cubit = context.read<CoachCubit>();
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is UpdateCoachDataLoadingState) ...[
                        const LinearProgressIndicator(
                          backgroundColor: ColorManager.primaryWith10Opacity,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                      ],
                      Center(
                          child: ProfileImageWidget(
                        imageUrl: cubit.coachEntity!.imageUrl,
                        image: cubit.image,
                      )),
                      Center(
                        child: CustomTextButton(
                          onPressed: () async {
                            await cubit.pickImage();
                          },
                          buttonText: AppStrings.editImage,
                          style: StylesManager.bold18,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      TextFormField(
                        style: StylesManager.regular16,
                        controller: _userNameController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return AppStrings.fieldRequiredError;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: AppStrings.name,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p8,
                                vertical: AppPadding.p8)),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      TextFormField(
                        style: StylesManager.regular16,
                        controller: _phoneController,
                        validator: (value) {
                          if (!value.isValidPhoneNumber()) {
                            return AppStrings.phoneNumberError;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: AppStrings.phone,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p8,
                                vertical: AppPadding.p8)),
                      ),
                      const ChangePasswordEmailButtons(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonWidget(
                        buttonText: AppStrings.save,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await cubit.updateCoachData(
                              name: _userNameController.text.trim(),
                              phoneNumber: _phoneController.text.trim(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
