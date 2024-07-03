import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/home_header_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/keep_progress_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/new_workouts_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/player_stats_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/user_appointments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
          ),
          child: RefreshIndicator(
            displacement: 1,
            onRefresh: () async {
              cubit.clear();
              await cubit.initHomeData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeaderWidget(
                      name: cubit.userEntity!.username,
                      welcomeText: AppStrings.checkActivity,
                      imageUrl: cubit.userEntity!.imageUrl,
                    ),
                    const SizedBox(height: AppSize.s16),
                    const PlayerStatsWidget(),
                    const KeepProgressWidget(),
                    const NewWorkoutsWidget(),
                    const UserAppointmentsWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
