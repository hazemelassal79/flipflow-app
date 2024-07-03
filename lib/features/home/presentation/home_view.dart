import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradiantContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: AppSize.s2,
          shadowColor: ColorManager.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppSize.s24),
              bottomRight: Radius.circular(AppSize.s24),
            ),
          ),
          centerTitle: true,
          title: Text(
            AppStrings.gymnasticsApp,
            style: StylesManager.bold20.copyWith(
              color: ColorManager.white,
            ),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (cubit.isError) {
              state = state as HomeErrorState;
              return CustomErrorWidget(
                text: state.message,
                onButtonPressed: () async {
                  await cubit.initHomeData();
                },
              );
            }
            if (cubit.isLoading) {
              return const CustomLoadingWidget();
            }
            return const HomeViewBody();
          },
        ),
      ),
    );
  }
}
