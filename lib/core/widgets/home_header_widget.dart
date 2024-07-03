import 'package:cached_network_image/cached_network_image.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget(
      {super.key,
      required this.name,
      required this.welcomeText,
      required this.imageUrl});

  final String name;
  final String welcomeText;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${name.split(' ')[0]}",
                style: StylesManager.bold24,
              ),
              Text(
                welcomeText,
                style: StylesManager.medium18,
              ),
            ],
          ),
        ),
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: AppSize.s45,
              backgroundColor: ColorManager.primary,
              child: CircleAvatar(
                radius: AppSize.s42,
                foregroundImage: imageProvider,
              )),
          placeholder: (context, url) => const CircleAvatar(
            radius: AppSize.s42,
          ),
          errorWidget: (context, url, error) {
            return const CircleAvatar(
                radius: AppSize.s45,
                foregroundImage: AssetImage(AssetsManager.placeholderImage));
          },
        ),
      ],
    );
  }
}
