import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/core/widgets/custom_text_button.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/book_info/age_picker_bloc_widget.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/book_info/field_name_text.dart';
import 'package:flipflow_app/features/appointment/presentation/widget/book_info/trainee_image_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookInfoViewBody extends StatefulWidget {
  const BookInfoViewBody({super.key});

  @override
  State<BookInfoViewBody> createState() => _BookInfoViewBodyState();
}

class _BookInfoViewBodyState extends State<BookInfoViewBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is CreateAppointmentErrorState) {
          showSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.traineeInfo,
                  style: StylesManager.bold18.copyWith(
                    color: ColorManager.black,
                  ),
                ),
                const TraineeImageWidget(),
                const FieldNameText(fieldName: AppStrings.name),
                TextFormField(
                  style: StylesManager.regular16,
                  onChanged: (value) => cubit.name = value.trim(),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return AppStrings.fieldRequiredError;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: AppSize.s8, horizontal: AppSize.s16),
                  ),
                ),
                const FieldNameText(fieldName: AppStrings.email),
                TextFormField(
                  style: StylesManager.regular16,
                  onChanged: (value) => cubit.email = value.trim(),
                  validator: (value) {
                    if (!value.isValidEmail()) {
                      return AppStrings.emailErrorText;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: AppSize.s8, horizontal: AppSize.s16),
                  ),
                ),
                const FieldNameText(fieldName: AppStrings.phone),
                TextFormField(
                  style: StylesManager.regular16,
                  onChanged: (value) => cubit.phoneNumber = value,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (!value.isValidPhoneNumber()) {
                      return AppStrings.phoneNumberError;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: AppSize.s8, horizontal: AppSize.s16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      buttonText: AppStrings.traineeAge,
                      style: StylesManager.medium14
                          .copyWith(color: ColorManager.primary),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return BlocProvider<AppointmentCubit>.value(
                                value: cubit,
                                child: const AgePickerBlocWidget(),
                              );
                            });
                      },
                    ),
                    Visibility(
                      visible: cubit.traineeAgeValue != null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(AppSize.s8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8, vertical: AppPadding.p8),
                        child: Text(
                          cubit.traineeAgeValue.toString(),
                          style: StylesManager.medium14
                              .copyWith(color: ColorManager.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                if (state is CreateAppointmentLoadingState) ...[
                  const Center(child: CircularProgressIndicator())
                ] else ...[
                  CustomButtonWidget(
                    buttonText: AppStrings.next,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (cubit.traineeAgeValue == null) {
                          showSnackBar(context,
                              text: AppStrings.selectAgeError);
                          return;
                        }
                        final centersCubit = context.read<CentersCubit>();
                        await cubit.createAppointment(
                            gymnasticTypeId:
                                centersCubit.currentGymnasticType!.uid,
                            coachId: centersCubit.currentCoach.uid,
                            centerId: centersCubit.currentCenterEntity!.uid);
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
