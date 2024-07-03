import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachUserCheckerWidget extends StatelessWidget {
  const CoachUserCheckerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                cubit.setAsTrainee();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14, vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                      color: cubit.isTrainee ? ColorManager.primary : null,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      border: Border.all(color: ColorManager.primary)),
                  child: Text(
                    "Trainee",
                    style: StylesManager.medium18.copyWith(
                        color: cubit.isTrainee
                            ? ColorManager.white
                            : ColorManager.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                cubit.setAsCoach();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p14, vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                      color: cubit.isTrainee ? null : ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      border: Border.all(color: ColorManager.primary)),
                  child: Text(
                    "Coach",
                    style: StylesManager.medium18.copyWith(
                        color: !cubit.isTrainee
                            ? ColorManager.white
                            : ColorManager.black),
                  )),
            ),
          ],
        );
      },
    );
  }
}