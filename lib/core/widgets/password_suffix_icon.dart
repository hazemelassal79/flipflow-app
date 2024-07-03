import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/widgets/custom_prefix_icon.dart';
import 'package:flutter/material.dart';

class CustomPasswordSuffixIcon extends StatefulWidget {
  const CustomPasswordSuffixIcon(
      {super.key, required this.value, required this.onTap});

  final bool value;
  final Function() onTap;
  @override
  State<CustomPasswordSuffixIcon> createState() =>
      _CustomPasswordSuffixIconState();
}

class _CustomPasswordSuffixIconState extends State<CustomPasswordSuffixIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.onTap.call();
        });
      },
      child: CustomFormFieldIcon(
        svgImagepath: widget.value
            ? AssetsManager.hidePasswordIcon
            : AssetsManager.showPasswordIcon,
      ),
    );
  }
}
