import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/coach_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachHomeView extends StatelessWidget {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<CoachCubit, CoachState>(
      builder: (context, state) {
        final cubit = context.read<CoachCubit>();
        if (state is CoachErrorState) {
          return CustomErrorWidget(
            text: state.message,
            onButtonPressed: () {
              cubit.initCoachHomeData();
            },
          );
        }
        if (cubit.coachEntity == null || cubit.appointments == null ) {
          return const Center(child: CircularProgressIndicator());
        }
        return const CoachHomeViewBody();
      },
    ));
  }
}
