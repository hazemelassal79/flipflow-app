import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyOnBoardingScreen = "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String prefsKeyUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyIsCoach = "PREFS_KEY_IS_COACH";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //on boarding
  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(prefsKeyOnBoardingScreen, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreen) ?? false;
  }

  // login
  Future<void> setUserLoggedIn(String uid) async {
    _sharedPreferences.setString(prefsKeyUserLoggedIn, uid);
  }

  Future<void> setCoachLoggedIn() async {
    await _sharedPreferences.setBool(prefsKeyIsCoach, true);
  }

  bool isCoach() {
    return _sharedPreferences.getBool(prefsKeyIsCoach) ?? false;
  }

  String? isUserLoggedIn() {
    return _sharedPreferences.getString(prefsKeyUserLoggedIn);
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(prefsKeyUserLoggedIn);
    if (isCoach()) {
      await _sharedPreferences.remove(prefsKeyIsCoach);
    }
  }
}
