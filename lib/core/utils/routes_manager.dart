import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/entities/workout_entity.dart';
import 'package:flipflow_app/core/res/ui_constants.dart';
import 'package:flipflow_app/core/widgets/fade_transition.dart';
import 'package:flipflow_app/core/widgets/slide_transition.dart';
import 'package:flipflow_app/features/appointment/presentation/appointment_layout.dart';
import 'package:flipflow_app/features/appointment/presentation/views/appointment_details_view.dart';
import 'package:flipflow_app/features/appointment/presentation/views/payment_done_view.dart';
import 'package:flipflow_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:flipflow_app/features/auth/presentation/views/login_view.dart';
import 'package:flipflow_app/features/auth/presentation/views/register_view.dart';
import 'package:flipflow_app/features/centers/presentation/views/center_details_view.dart';
import 'package:flipflow_app/features/centers/presentation/views/coaches_view.dart';
import 'package:flipflow_app/features/coach/presentation/coach_layout.dart';
import 'package:flipflow_app/features/coach/presentation/views/edit_coach_profile_view.dart';
import 'package:flipflow_app/features/home/presentation/home_layout.dart';
import 'package:flipflow_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:flipflow_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flipflow_app/features/reminder/presentation/reminder_view.dart';
import 'package:flipflow_app/features/splash/presentation/splash_view.dart';
import 'package:flipflow_app/features/user_settings/presentation/views/change_email.dart';
import 'package:flipflow_app/features/user_settings/presentation/views/change_password_view.dart';
import 'package:flipflow_app/features/workouts/presentation/views/exercise_details_view.dart';
import 'package:flipflow_app/features/workouts/presentation/views/workout_details_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/appointment/presentation/views/paymob_web_view.dart';

abstract class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPassword = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String workoutDetails = "/workoutDetails";
  static const String exerciseDetails = "/exerciseDetails";
  static const String centerDetails = "/centerDetails";
  static const String coachesRoute = "/coaches";
  static const String reminderRoute = "/reminder";
  static const String editProfileRoute = "/editProfile";
  static const String changePasswordRoute = "/changePassword";
  static const String changeEmailRoute = "/changeEmail";
  static const String appointmentRoute = "/appointment";
  static const String appointmentDetailsRoute = "/appointmentDetails";
  static const String paymentDoneRoute = "/paymentDone";
  static const String paymobWebViewRoute = "/paymobWebView";
  static const String coachLayoutRoute = "/coachLayout";
  static const String editCoachProfileRoute = "/editCoachProfile";
}

abstract class RouteGenerator {
  static final GoRouter router = GoRouter(routes: _routes);

  static List<GoRoute> get _routes {
    return [
      GoRoute(
        path: Routes.splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.onBoardingRoute,
        builder: (context, state) {
          ServiceLocator.setupOnBoardingModule();
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: Routes.loginRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupAuthModule();
          return _fadeAnimationTransitionBuilder(const LoginView());
        },
      ),
      GoRoute(
        path: Routes.registerRoute,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const ForgetPasswordView());
        },
      ),
      GoRoute(
        path: Routes.homeRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupHomeModule();
          return _fadeAnimationTransitionBuilder(const HomeLayout());
        },
      ),
      GoRoute(
        path: Routes.workoutDetails,
        pageBuilder: (context, state) {
          ServiceLocator.setupWorkoutsModule(state.extra as WorkoutEntity?);
          return _slideAnimationTransition(const WorkoutDetailsView());
        },
      ),
      GoRoute(
        path: Routes.exerciseDetails,
        pageBuilder: (context, state) {
          ServiceLocator.setupExerciseDetailsModule((state.extra as int?) ?? 0);
          return _slideAnimationTransition(const ExerciseDetailsView());
        },
      ),
      GoRoute(
        path: Routes.centerDetails,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const CenterDetailsView());
        },
      ),
      GoRoute(
        path: Routes.coachesRoute,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const CoachesView());
        },
      ),
      GoRoute(
        path: Routes.reminderRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupReminderModule();
          return _slideAnimationTransition(const ReminderView());
        },
      ),
      GoRoute(
        path: Routes.editProfileRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupEditProfileModule();
          return _slideAnimationTransition(const EditProfileView());
        },
      ),
      GoRoute(
        path: Routes.changePasswordRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupUserSettingsModule();
          return _slideAnimationTransition(const ChangePasswordView());
        },
      ),
      GoRoute(
        path: Routes.changeEmailRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupUserSettingsModule();
          return _slideAnimationTransition(const ChangeEmailView());
        },
      ),
      GoRoute(
        path: Routes.appointmentRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupAppointmentModule();
          return _slideAnimationTransition(const AppointmentLayout());
        },
      ),
      GoRoute(
        path: Routes.paymentDoneRoute,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const PaymentDoneView());
        },
      ),
      GoRoute(
        path: Routes.paymobWebViewRoute,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const PaymobWebView());
        },
      ),
      GoRoute(
        path: Routes.coachLayoutRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupCoachLayoutModule();
          return _fadeAnimationTransitionBuilder(const CoachLayout());
        },
      ),
      GoRoute(
        path: Routes.editCoachProfileRoute,
        pageBuilder: (context, state) {
          return _slideAnimationTransition(const EditCoachProfileView());
        },
      ),
      GoRoute(
        path: Routes.appointmentDetailsRoute,
        pageBuilder: (context, state) {
          ServiceLocator.setupAppointmentDetailsModule(
              state.extra as AppointmentEntity);
          return _slideAnimationTransition(const AppointmentDetailsView());
        },
      ),
    ];
  }

  static _fadeAnimationTransitionBuilder(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CustomFadeTransition(
          durationInMilliSeconds: UiConstants.pageTransitionDelay,
          child: child,
        );
      },
    );
  }

  static _slideAnimationTransition(Widget child) {
    return CustomSlideTransition(child: child);
  }
}
