import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_empty_screen_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/core/widgets/custom_search_field.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/centers/center_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CentersViewBody extends StatefulWidget {
  const CentersViewBody({super.key});

  @override
  State<CentersViewBody> createState() => _CentersViewBodyState();
}

class _CentersViewBodyState extends State<CentersViewBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        if (cubit.centersList == null || state is GetCentersLoadingState) {
          return const CustomLoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p22, vertical: AppPadding.p14),
          child: RefreshIndicator(
            displacement: 1,
            onRefresh: () async {
              cubit.clear();
              await cubit.getCenters();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  CustomSearchField(
                    controller: _searchController,
                    onSubmit: (value) async {
                      if (value.trim().isNotEmpty) {
                        await cubit.getCenters(value.trim());
                      }
                    },
                  ),
                  if (cubit.centersList?.isEmpty ?? true) ...[
                    const CustomEmptyScreen(),
                  ] else ...[
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p14),
                        itemBuilder: (context, index) {
                          return CenterItemWidget(
                              centerEntity: cubit.centersList![index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: AppSize.s14,
                          );
                        },
                        itemCount: cubit.centersList!.length),
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
