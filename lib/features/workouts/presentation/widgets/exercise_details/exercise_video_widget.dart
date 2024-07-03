import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/widgets/custom_snackbar.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/exercise_details/exercise_details_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/widgets/exercise_details/video_controllers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';

class ExerciseVideoWidget extends StatefulWidget {
  const ExerciseVideoWidget({super.key});

  @override
  State<ExerciseVideoWidget> createState() => _ExerciseVideoWidgetState();
}

class _ExerciseVideoWidgetState extends State<ExerciseVideoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<ExerciseDetailsCubit, ExerciseDetailsState>(
      listener: (context, state) {
        if (state is LoadVideoErrorState) {
          showSnackBar(context, text: state.message);
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        final cubit = ServiceLocator.get<ExerciseDetailsCubit>();
        if (state is LoadVideoLoadingState || cubit.controller == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return AspectRatio(
          aspectRatio: size.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedVideoPlayerPlus(cubit.controller!),
              const VideoControllersWidget(),
            ],
          ),
        );
      },
    );
  }
}
