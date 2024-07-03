import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/change_password_email_widget.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/core/widgets/profile_image_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController _userNameController;

  @override
  initState() {
    super.initState();
    _userNameController = TextEditingController();
    _userNameController.text = context.read<ProfileCubit>().user!.username;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileErrorState) {
          showSnackBar(
            context,
            text: state.message,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        final profileCubit = context.read<ProfileCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16, horizontal: AppPadding.p20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is EditProfileLoadingState) ...[
                      const LinearProgressIndicator(
                        backgroundColor: ColorManager.primaryWith10Opacity,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                    ],
                    Center(
                        child: ProfileImageWidget(
                      image: cubit.image,
                      imageUrl: profileCubit.user!.imageUrl,
                    )),
                    Center(
                      child: CustomTextButton(
                        onPressed: () {
                          cubit.pickImage();
                        },
                        buttonText: AppStrings.editImage,
                        style: StylesManager.bold18,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p12),
                      child: Text(
                        AppStrings.username,
                        style: StylesManager.semiBold16
                            .copyWith(color: ColorManager.black),
                      ),
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
                          hintText: AppStrings.username,
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
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButtonWidget(
                      buttonText: AppStrings.save,
                      onPressed: () async {
                        await cubit.updateProfile(
                          _userNameController.text.trim(),
                          onDone: () async {
                            final cubit = context.read<HomeCubit>();
                            await cubit.getUserData();
                          },
                        );
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
