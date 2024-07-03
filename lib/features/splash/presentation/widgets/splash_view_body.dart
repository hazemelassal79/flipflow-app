import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/assets_manager.dart';
import 'package:flipflow_app/core/utils/app_preferences.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/core/widgets/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomFadeTransition(
        onDone: _goNext,
        child: Center(child: Image.asset(AssetsManager.splashLogo)));
  }

  _goNext() {
    final pref = ServiceLocator.get<AppPreferences>();
    if (pref.isUserLoggedIn() != null) {
      if (pref.isCoach()) {
        GoRouter.of(context).pushReplacement(Routes.coachLayoutRoute);
        return;
      }
      GoRouter.of(context).pushReplacement(Routes.homeRoute);
      return;
    }
    if (pref.isOnBoardingScreenViewed()) {
      GoRouter.of(context).pushReplacement(Routes.loginRoute);
      return;
    }
    GoRouter.of(context).pushReplacement(Routes.onBoardingRoute);
  }
}
