
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/exercise_details/exercise_details_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoControllersWidget extends StatelessWidget {
  const VideoControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseDetailsCubit, ExerciseDetailsState>(
      listener: (context, state) {
        if(state is ExerciseDoneErrorState){
          showSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ExerciseDetailsCubit>();
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: cubit.exerciseEntityIndex != 0,
                child: IconButton(
                    icon: Container(
                      height: AppSize.s40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        color: ColorManager.primary,
                      ),
                      child: const Icon(Icons.arrow_back_ios_rounded,
                          size: AppSize.s24, color: ColorManager.white),
                    ),
                    onPressed: () async{
                     await cubit.goPrevious();
                    }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: ColorManager.primary,
                foregroundColor: ColorManager.white,
                child: IconButton(
                  onPressed: () {
                    cubit.pausePlayVideo();
                  },
                  icon:
                      Icon(cubit.isVideoPlaying ? Icons.pause : Icons.play_arrow),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: cubit.exerciseEntityIndex < cubit.exercises!.length - 1,
                child: IconButton(
                  icon: Container(
                    height: AppSize.s40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      color: ColorManager.primary,
                    ),
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        size: AppSize.s24, color: ColorManager.white),
                  ),
                  onPressed: () async {
                    var workout = context.read<WorkoutsCubit>().currentWorkout;
                    await cubit.goNext(workout.uid);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
