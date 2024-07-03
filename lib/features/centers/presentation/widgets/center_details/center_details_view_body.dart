import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/widgets/custom_error_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/center_details_body.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/header_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterDetailsViewBody extends StatelessWidget {
  const CenterDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        if (cubit.currentCenterEntity == null &&
            state is GetCenterDetailsErrorState) {
          return CustomErrorWidget(text: state.message);
        }
        if (cubit.currentCenterEntity == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            const CenterDetailHeaderImage(),
            Positioned(
                top: height * UiConstants.centerDetailsColumnTopFactor,
                bottom: 0,
                left: 0,
                right: 0,
                child: const CenterDetailsBodyWidget()),
          ],
        );
      },
    );
  }
}
