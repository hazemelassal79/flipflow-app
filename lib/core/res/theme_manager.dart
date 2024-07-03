import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get appTheme {
  return ThemeData(
    primaryColor: ColorManager.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryWith10Opacity,
      primary: ColorManager.primary,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.gradiantPrimary,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      fillColor: ColorManager.gradiantPrimary2,
      filled: true,
      hintStyle: StylesManager.regular14,
      errorStyle:
          StylesManager.regular12.copyWith(color: ColorManager.errorColor),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
          borderSide:
              const BorderSide(color: ColorManager.white, width: AppSize.s1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
          borderSide:
              const BorderSide(color: ColorManager.primary, width: AppSize.s1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
          borderSide: const BorderSide(
              color: ColorManager.errorColor, width: AppSize.s1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
          borderSide:
              const BorderSide(color: ColorManager.primary, width: AppSize.s1)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.gradiantPrimary2,
      selectedLabelStyle: StylesManager.regular12,
      unselectedLabelStyle: StylesManager.regular12,
      selectedItemColor: ColorManager.primary,
      elevation: 2,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ),
    ),
    splashColor: Colors.transparent,
  );
}
