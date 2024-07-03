import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/centers/centers_view_body.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CentersView extends StatelessWidget {
  const CentersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.centers,
            style: StylesManager.bold24,
          ),
          centerTitle: true,
        ),
        body: CustomGradiantContainer(
            child: BlocBuilder<CentersCubit, CentersState>(
          builder: (context, state) {
            var cubit = context.read<CentersCubit>();
            if (cubit.centersList == null && state is GetCentersErrorState) {
              return CustomErrorWidget(
                  text: state.message,
                  onButtonPressed: () async {
                    final homeCubit = context.read<HomeCubit>();
                    await cubit.getCenters();
                    if (homeCubit.userEntity == null) {
                      await homeCubit.initHomeData();
                    }
                  });
            }
            return const CentersViewBody();
          },
        )));
  }
}
