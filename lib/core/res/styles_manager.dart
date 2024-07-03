import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/font_manager.dart';
import 'package:flutter/material.dart';

abstract class StylesManager {
  static TextStyle regular12 = _getTextStyle(
      FontSize.s12, FontWeightManager.regular, ColorManager.lightGrey);
  static TextStyle regular14 = _getTextStyle(
      FontSize.s14, FontWeightManager.regular, ColorManager.lightGrey);
  static TextStyle regular16 = _getTextStyle(
      FontSize.s16, FontWeightManager.regular, ColorManager.black);
  static TextStyle regular24 = _getTextStyle(
      FontSize.s24, FontWeightManager.regular, ColorManager.black);
  static TextStyle medium12 =
      _getTextStyle(FontSize.s12, FontWeightManager.medium, ColorManager.black);
  static TextStyle medium14 = _getTextStyle(
      FontSize.s14, FontWeightManager.medium, ColorManager.primary);
  static TextStyle medium18 =
      _getTextStyle(FontSize.s18, FontWeightManager.medium, ColorManager.black);
  static TextStyle medium22 =
      _getTextStyle(FontSize.s22, FontWeightManager.medium, ColorManager.black);
  static TextStyle semiBold12 = _getTextStyle(
      FontSize.s12, FontWeightManager.semiBold, ColorManager.black);
  static TextStyle semiBold16 = _getTextStyle(
      FontSize.s16, FontWeightManager.semiBold, ColorManager.white);
  static TextStyle semiBold18 = _getTextStyle(
      FontSize.s18, FontWeightManager.semiBold, ColorManager.white);
  static TextStyle semiBold24 = _getTextStyle(
      FontSize.s24, FontWeightManager.semiBold, ColorManager.white);
  static TextStyle semiBold40 = _getTextStyle(
      FontSize.s40, FontWeightManager.semiBold, ColorManager.white);
  static TextStyle bold16 =
      _getTextStyle(FontSize.s16, FontWeightManager.bold, ColorManager.black);
  static TextStyle bold18 =
      _getTextStyle(FontSize.s18, FontWeightManager.bold, ColorManager.primary);
  static TextStyle bold20 =
      _getTextStyle(FontSize.s20, FontWeightManager.bold, ColorManager.black);
  static TextStyle bold24 =
      _getTextStyle(FontSize.s24, FontWeightManager.bold, ColorManager.black);
  static TextStyle bold30 =
      _getTextStyle(FontSize.s30, FontWeightManager.bold, ColorManager.black);

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: fontWeight);
  }
}
