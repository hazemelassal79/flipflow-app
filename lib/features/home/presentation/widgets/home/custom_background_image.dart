import 'package:flipflow_app/core/widgets/custom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:themed/themed.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ChangeColors(
        brightness: -0.13,
        child: CustomNetworkImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
