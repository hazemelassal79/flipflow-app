import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/coach_item_widget.dart';
import 'package:flipflow_app/core/widgets/custom_empty_screen_widget.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_search_field.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CoachesViewBody extends StatefulWidget {
  const CoachesViewBody({super.key});

  @override
  State<CoachesViewBody> createState() => _CoachesViewBodyState();
}

class _CoachesViewBodyState extends State<CoachesViewBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(builder: (context, state) {
      final cubit = context.read<CentersCubit>();
      if (cubit.coachesList == null && state is GetCoachesErrorState) {
        return CustomErrorWidget(text: state.message);
      }
      if (cubit.coachesList == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return _getBodyWidget(cubit);
    });
  }

  Widget _getBodyWidget(CentersCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p22, vertical: AppPadding.p14),
      child: RefreshIndicator(
        displacement: 1,
        onRefresh: () async {
          cubit.getCoachesOfGymnasticType();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CustomSearchField(
                controller: _controller,
                onSubmit: (value) async {
                  if (value.trim().isNotEmpty) {
                    await cubit.getCoachesOfGymnasticType(value.trim());
                  }
                },
              ),
              if (cubit.coachesList?.isEmpty ?? true) ...[
                const CustomEmptyScreen(
                  text: AppStrings.emptyCoachesList,
                ),
              ] else ...[
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p14),
                    itemBuilder: (context, index) {
                      return CoachItemWidget(
                        onTap: () {
                          cubit.setCurrentCoach = cubit.coachesList![index];
                          GoRouter.of(context).push(Routes.appointmentRoute);
                        },
                        coach: cubit.coachesList![index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: AppSize.s14,
                      );
                    },
                    itemCount: cubit.coachesList?.length ?? 0),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
