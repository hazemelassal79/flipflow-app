import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GymnasticsTypeItemWidget extends StatelessWidget {
  const GymnasticsTypeItemWidget({super.key, required this.entity});

  final GymnasticTypeEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(AppSize.s14)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p12,
            bottom: AppPadding.p12,
            left: AppPadding.p16,
          ),
          child: Row(
            children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s14)),
                  child: CustomNetworkImage(
                    imageUrl: entity.imageUrl,
                    height: AppSize.s80,
                    width: AppSize.s90,
                  )),
              const SizedBox(
                width: AppSize.s12,
              ),
              Expanded(
                child: Text(
                  entity.name,
                  style: StylesManager.semiBold16,
                ),
              ),
              IconButton(
                  style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  iconSize: AppSize.s16,
                  onPressed: () {
                    final cubit = context.read<CentersCubit>();
                    cubit.setCurrentGymnasticType = entity;
                    cubit.getCoachesOfGymnasticType();
                    GoRouter.of(context).push(Routes.coachesRoute);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorManager.white,
                  ))
            ],
          ),
        ));
  }
}
