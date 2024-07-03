import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterDetailHeaderImage extends StatelessWidget {
  const CenterDetailHeaderImage({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomNetworkImage(
              imageUrl: cubit.currentCenterEntity!.imageUrl,
              fit: BoxFit.cover,
              height: height * UiConstants.centerDetailsImageFactor,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p18),
              child: CustomBackArrow(
                radius: AppSize.s16,
              ),
            ),
          ],
        );
      },
    );
  }
}
