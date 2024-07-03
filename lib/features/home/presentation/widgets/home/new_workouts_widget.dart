import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/workout_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewWorkoutsWidget extends StatelessWidget {
  const NewWorkoutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Visibility(
          visible: cubit.newWorkouts?.isNotEmpty ?? false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p18, bottom: AppPadding.p18),
                child: Text(
                  AppStrings.discoverWorkouts,
                  style: StylesManager.bold18,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true  ,
                  padEnds: false,
                  height: UiConstants.newWorkoutCardHeight,
                ),
                items: cubit.newWorkouts
                    ?.map((entity) => NewWorkoutItemWidget(
                          entity: entity,
                        ))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
