import 'package:flutter/material.dart';

abstract class ColorManager {
  static const gradiantColors = <Color>[
    ColorManager.gradiantPrimary,
    ColorManager.gradiantPrimary2,
  ];
  static const textColor = Color(0xFF1F2022);
  static const primary = Color(0xFF6358E1);
  static const gradiantPrimary = Color(0xFFCFC5FB);
  static const primaryWith10Opacity = Color(0x1a6358E1);
  static const gradiantPrimary2 = Color(0xFFEBEBEB);
  static const lightGrey = Color(0xFFADA4A5);
  static const lightGrey2 = Color(0xFFECEBFA);
  static const black = Color(0xFF1F2022);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFB6BDC6);
  static const tableBackgroundColor = Color(0xffD9D9D9);
  static const loadingBlack = Color(0x80000000);
  static const borderColor = Color(0xFFB9BBC5);
  static const errorColor = Color(0xffff3333);
}
