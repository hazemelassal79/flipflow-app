import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/profile/coach_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachProfileView extends StatelessWidget {
  const CoachProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
      final cubit = context.read<CoachCubit>();
      if (cubit.coachEntity == null && state is CoachErrorState) {
        return CustomErrorWidget(text: state.message);
      }

      if (cubit.coachEntity == null) {
        return const CustomLoadingWidget();
      }
      return const CoachProfileViewBody();
    });
  }
}
