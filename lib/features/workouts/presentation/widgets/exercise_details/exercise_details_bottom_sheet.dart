import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/exercise_details/exercise_details_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/exercise_details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetailBottomSheet extends StatelessWidget {
  const ExerciseDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.get<ExerciseDetailsCubit>(),
      child: BlocBuilder<ExerciseDetailsCubit, ExerciseDetailsState>(
        builder: (context, state) {
          final cubit = context.read<ExerciseDetailsCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.exercises![cubit.exerciseEntityIndex].name,
                    style: StylesManager.bold18
                        .copyWith(color: ColorManager.black),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p16),
                      itemBuilder: (context, index) {
                        return ExerciseDetailsTextWidget(
                            order: index + 1,
                            text: _getDescreption(cubit)[index].trim());
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: AppSize.s14,
                        );
                      },
                      itemCount: _getDescreption(cubit).length - 1)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _getDescreption(ExerciseDetailsCubit cubit) {
    return cubit.exercises![cubit.exerciseEntityIndex].description.split('.');
  }
}
