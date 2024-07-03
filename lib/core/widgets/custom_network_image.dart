import 'package:cached_network_image/cached_network_image.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flutter/cupertino.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) {
        return Image.asset(
          AssetsManager.placeholderImage,
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
