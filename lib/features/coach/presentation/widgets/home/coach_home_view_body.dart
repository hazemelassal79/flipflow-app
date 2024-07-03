import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_empty_screen_widget.dart';
import 'package:flipflow_app/core/widgets/home_header_widget.dart';
import 'package:flipflow_app/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:flipflow_app/features/coach/presentation/widgets/home/appointment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachHomeViewBody extends StatelessWidget {
  const CoachHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      builder: (context, state) {
        final cubit = context.read<CoachCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            cubit.clear();
            await cubit.initCoachHomeData();
          },
          displacement: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p16,
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  HomeHeaderWidget(
                      name: cubit.coachEntity!.name,
                      welcomeText: AppStrings.checkYourAppointments,
                      imageUrl: cubit.coachEntity!.imageUrl),
                  if (cubit.appointments?.isEmpty ?? true) ...[
                    const CustomEmptyScreen(
                      text: AppStrings.emptyAppointmentsList,
                    ),
                  ] else ...[
                    ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: AppSize.s14),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AppointmentItemWidget(
                            entity: cubit.appointments![index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: AppSize.s14,
                          );
                        },
                        itemCount: cubit.appointments?.length ?? 0)
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
