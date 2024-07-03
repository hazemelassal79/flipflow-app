import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/app_preferences.dart';
import 'package:flipflow_app/features/onboarding/domain/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  OnBoardingController(this._appPreferences);
  final AppPreferences _appPreferences;
  int _currentIndex = 0;

  final pages = <OnBoardingModel>[
    OnBoardingModel(
        title: AppStrings.onboarding1Title,
        body: AppStrings.onboarding1Description,
        imagePath: AssetsManager.onBoardingImage1),
    OnBoardingModel(
        title: AppStrings.onboarding2Title,
        body: AppStrings.onboarding2Description,
        imagePath: AssetsManager.onBoardingImage2),
    OnBoardingModel(
        title: AppStrings.onboarding3Title,
        body: AppStrings.onboarding3Description,
        imagePath: AssetsManager.onBoardingImage3),
  ];

  void changeIndex(int newIndex) {
    if (newIndex != _currentIndex) {
      _currentIndex = newIndex;
      notifyListeners();
    }
  }

  void setOnBoardingViewd() async {
    await _appPreferences.setOnBoardingScreenViewed();
  }

  void increamentIndex() {
    if (_currentIndex != 2) {
      _currentIndex++;
      notifyListeners();
    }
  }

  int get currentIndex => _currentIndex;

  double get indicatorValue => (_currentIndex + 1) / pages.length;
}
