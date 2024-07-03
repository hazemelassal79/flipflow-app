import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/widgets/profile/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: CustomGradiantContainer(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final cubit = context.read<HomeCubit>();
                if (cubit.userEntity == null && state is HomeErrorState) {
                  return CustomErrorWidget(text: state.message);
                }
                if (cubit.userEntity == null) {
                  return const CustomLoadingWidget();
                }
                context.read<ProfileCubit>().setUser(cubit.userEntity);
                return const ProfileViewBody();
              },
            ),
          ),
        );
      },
    );
  }
}
