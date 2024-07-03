import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget(
      {super.key, required this.imageUrl, required this.image});
  final String imageUrl;
  final File? image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CircleAvatar(
        radius: (height * 0.25) / 2,
        backgroundColor: ColorManager.primary,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: ((height * 0.25) / 2) - 3,
            backgroundImage: image != null ? FileImage(image!) : imageProvider,
          ),
          errorWidget: (context, url, error) {
            return CircleAvatar(
              radius: ((height * 0.25) / 2) - 3,
              backgroundImage: image != null
                  ? FileImage(image!) as ImageProvider
                  : const AssetImage(AssetsManager.placeholderImage),
            );
          },
        ));
  }
}
