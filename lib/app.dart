import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/theme_manager.dart';
import 'package:flipflow_app/core/utils/routes_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/providers/layout_controller.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:flipflow_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flipflow_app/features/user_settings/presentation/cubit/user_settings_cubit.dart';
import 'package:flipflow_app/features/workouts/presentation/cubits/workouts_cubit/workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/coach/presentation/cubit/coach_cubit.dart';
import 'features/coach/presentation/provider/coach_module_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceLocator.get<AuthCubit>(),
        ),
        ChangeNotifierProvider(
            create: (context) => ServiceLocator.get<LayoutController>()),
        BlocProvider(
          create: (context) => ServiceLocator.get<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.get<WorkoutsCubit>(),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.get<CentersCubit>(),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.get<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.get<EditProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.get<AppointmentCubit>(),
        ),
        ChangeNotifierProvider(
            create: (context) => ServiceLocator.get<CoachModuleController>()),
        BlocProvider(create: (context) => ServiceLocator.get<CoachCubit>()),
        BlocProvider(
            create: (context) => ServiceLocator.get<UserSettingsCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouteGenerator.router,
        title: AppStrings.appTitle,
        theme: appTheme,
      ),
    );
  }
}
