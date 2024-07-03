import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_circled_image.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/custom_item_container.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/location_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CenterItemWidget extends StatelessWidget {
  const CenterItemWidget({super.key, required this.centerEntity});

  final CenterEntity centerEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return GestureDetector(
          onTap: () async {
            cubit.getCenterDetails(centerEntity.uid);
            GoRouter.of(context).push(Routes.centerDetails);
          },
          child: CustomItemContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCircledImage(
                    imageUrl: centerEntity.imageUrl, radius: AppSize.s30),
                const SizedBox(
                  width: AppSize.s18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(centerEntity.name, style: StylesManager.semiBold18),
                      LocationButtonWidget(
                        locationEntity: centerEntity.location,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
