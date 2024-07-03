import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_button_widget.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/reminder/presentation/cubit/reminder_cubit.dart';
import 'package:flipflow_app/features/reminder/presentation/widgets/repeat_widget.dart';
import 'package:flipflow_app/features/reminder/presentation/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReminderCubit, ReminderState>(
      listener: (context, state) {
        if (state is SetReminderSuccsessSate) {
          showSnackBar(context,
              text: "Reminder set successfully", color: ColorManager.primary);
        }

        if (state is SetReminderErrorState) {
          showSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) {
        final cubit = ServiceLocator.get<ReminderCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.selectReminder,
                      style: StylesManager.semiBold18
                          .copyWith(color: ColorManager.black),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    TimePickerWidget(
                      onTimeChanged: (time) {
                        cubit.time = time;
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      AppStrings.howOftenRepeat,
                      style: StylesManager.semiBold18
                          .copyWith(color: ColorManager.black),
                    ),
                    RepeatWidget(
                      onChanged: (repeatOption) {
                        cubit.repeatOption = repeatOption;
                      },
                    ),
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
                        await cubit.setReminder();
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
