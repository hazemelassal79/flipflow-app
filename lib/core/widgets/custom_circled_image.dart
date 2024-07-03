import 'package:cached_network_image/cached_network_image.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomCircledImage extends StatelessWidget {
  const CustomCircledImage(
      {super.key, required this.imageUrl, required this.radius});

  final double radius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: radius,
          foregroundImage: imageProvider,
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          radius: radius,
          foregroundImage: const AssetImage(AssetsManager.placeholderImage),
        ),
      ),
    );
  }
}
