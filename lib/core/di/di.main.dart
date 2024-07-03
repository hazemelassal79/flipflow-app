part of 'di.dart';

abstract class ServiceLocator {
  static final GetIt _locator = GetIt.instance;

  static T get<T extends Object>() => _locator<T>();

  static void register<T extends Object>(T instance) {
    if (!isRegistered<T>()) {
      _locator.registerLazySingleton<T>(() => instance);
    }
  }

  static isRegistered<T extends Object>() => _locator.isRegistered<T>();

  static void registerFactory<T extends Object>(T instance) {
    if (isRegistered<T>()) {
      _locator.unregister<T>();
    }

    _locator.registerFactory<T>(() => instance);
  }

  static void unregister<T extends Object>() => _locator.unregister<T>();

  static Future<void> setup() async {
    register<NetworkInfo>(NetworkInfoImpl(InternetConnectionChecker()));
    register<FirebaseFirestore>(FirebaseFirestore.instance);
    register<FirebaseAuth>(FirebaseAuth.instance);
    register<FirebaseStorage>(FirebaseStorage.instance);
    register<AppPreferences>(
        AppPreferences(await SharedPreferences.getInstance()));
  }

  static Future<void> setupOnBoardingModule() async {
    register<OnBoardingController>(OnBoardingController(get<AppPreferences>()));
  }

  static void setupAuthModule() {
    register<AuthDataSource>(
        AuthDataSourceImpl(get<FirebaseAuth>(), get<FirebaseFirestore>()));
    register<AuthRepository>(
        AuthRepositoryImpl(get<AuthDataSource>(), get<NetworkInfo>()));
    register<SignInUseCase>(SignInUseCase(get<AuthRepository>()));
    register<RegisterUseCase>(RegisterUseCase(get<AuthRepository>()));
    register<ForgetPasswordUseCase>(
        ForgetPasswordUseCase(get<AuthRepository>()));
    register<CoachSignInUseCase>(CoachSignInUseCase(get<AuthRepository>()));
    register<AuthCubit>(AuthCubit(
        get<SignInUseCase>(),
        get<RegisterUseCase>(),
        get<CoachSignInUseCase>(),
        get<ForgetPasswordUseCase>(),
        get<AppPreferences>()));
  }

  static Future<void> setupHomeModule() async {
    register<LayoutController>(LayoutController());
    if (!isRegistered<HomeCubit>()) {
      register<HomeDataSource>(
          HomeDataSourceImpl(get<FirebaseFirestore>(), get<FirebaseAuth>()));
      register<HomeRepository>(
          HomeRepositoryImpl(get<NetworkInfo>(), get<HomeDataSource>()));
      register<GetUserUseCase>(GetUserUseCase(get<HomeRepository>()));
      register<GetNewWorkoutsUseCase>(
          GetNewWorkoutsUseCase(get<HomeRepository>()));
      register<GetUserAppointmentUseCase>(
          GetUserAppointmentUseCase(get<HomeRepository>()));
      var cubit = HomeCubit(get<GetUserUseCase>(), get<GetNewWorkoutsUseCase>(),
          get<GetUserAppointmentUseCase>());
      register<HomeCubit>(cubit);
    }
    final cubit = get<HomeCubit>();
    if (cubit.userEntity == null) {
      await get<HomeCubit>().initHomeData();
    }
  }

  static Future<void> setupWorkoutsModule(
      [WorkoutEntity? workoutEntity]) async {
    if (!isRegistered<WorkoutsCubit>()) {
      register<WorkoutDataSource>(
          WorkoutDataSourceImpl(get<FirebaseFirestore>()));
      register<WorkoutRepository>(
          WorkoutRepositoryImpl(get<WorkoutDataSource>(), get<NetworkInfo>()));
      register<GetWorkoutUseCase>(GetWorkoutUseCase(get<WorkoutRepository>()));
      register<GetExercisesUseCase>(
          GetExercisesUseCase(get<WorkoutRepository>()));
      register<WorkoutsCubit>(
          WorkoutsCubit(get<GetWorkoutUseCase>(), get<GetExercisesUseCase>()));
    }
    final cubit = get<WorkoutsCubit>();
    if (workoutEntity != null && cubit.exercises == null) {
      cubit.setCurrentWorkout = workoutEntity;
      await cubit.getExercisesOfWorkout(workoutEntity);
      return;
    }
    await get<HomeCubit>().initHomeData();
    if (cubit.workouts == null) {
      await cubit.getWorkouts();
    }
  }

  static Future<void> setupExerciseDetailsModule(
      int exerciseEntityIndex) async {
    register<UpdateUserWorkoutUseCase>(
        UpdateUserWorkoutUseCase(get<WorkoutRepository>()));
    final workoutCubit = get<WorkoutsCubit>();
    log(workoutCubit.exercises.toString());
    final cubit = ExerciseDetailsCubit(get<UpdateUserWorkoutUseCase>(),
        exerciseEntityIndex, workoutCubit.exercises);
    registerFactory(cubit);
    if (cubit.controller == null) {
      await cubit
          .loadVideo(workoutCubit.exercises![exerciseEntityIndex].videoUrl);
      await cubit.setUserDoneExercise(workoutCubit.currentWorkout.uid);
    }
  }

  static Future<void> setupCentersModule() async {
    if (!isRegistered<CentersCubit>()) {
      register<CentersDataSource>(
          CentersDataSourceImpl(get<FirebaseFirestore>()));
      register<CentersRepository>(
          CentersRepositoryImpl(get<CentersDataSource>(), get<NetworkInfo>()));
      register<GetCentersUseCase>(GetCentersUseCase(get<CentersRepository>()));
      register<GetCenterDetailsUseCase>(
          GetCenterDetailsUseCase(get<CentersRepository>()));
      register<GetCoachesUseCase>(GetCoachesUseCase(get<CentersRepository>()));
      register<CentersCubit>(CentersCubit(get<GetCentersUseCase>(),
          get<GetCenterDetailsUseCase>(), get<GetCoachesUseCase>()));
      final cubit = get<CentersCubit>();
      await get<HomeCubit>().initHomeData();
      if (cubit.centersList == null) {
        await cubit.getCenters();
      }
    }
  }

  static Future<void> setupProfileModule() async {
    setupUserSettingsModule();
    if (!isRegistered<UploadImageService>()) {
      register<UploadImageService>(UploadImageService(get<FirebaseStorage>()));
    }
    if (!isRegistered<ProfileCubit>()) {
      register<ProfileDataSource>(ProfileDataSourceImpl(get<FirebaseAuth>(),
          get<FirebaseFirestore>(), get<UploadImageService>()));
      register<ProfileRepository>(
          ProfileRepositoryImpl(get<ProfileDataSource>(), get<NetworkInfo>()));
      register<ProfileCubit>(ProfileCubit());
    }
  }

  static Future<void> setupEditProfileModule() async {
    if (!isRegistered<EditProfileCubit>()) {
      register<UpdateProfileUseCase>(
          UpdateProfileUseCase(get<ProfileRepository>()));
      register<EditProfileCubit>(EditProfileCubit(get<UpdateProfileUseCase>()));
    }
  }

  static Future<void> setupReminderModule() async {
    register<BackgroundService>(BackgroundService());
    register<ReminderRepository>(
        ReminderRepositoryImpl(get<BackgroundService>()));
    register<ReminderOnMonAndFriUseCase>(
        ReminderOnMonAndFriUseCase(get<ReminderRepository>()));
    register<ReminderOnWeekendsUseCase>(
        ReminderOnWeekendsUseCase(get<ReminderRepository>()));
    register<DailyReminderUseCase>(
        DailyReminderUseCase(get<ReminderRepository>()));
    register<WeeklyReminderUseCase>(
        WeeklyReminderUseCase(get<ReminderRepository>()));
    registerFactory(ReminderCubit(
        get<ReminderOnMonAndFriUseCase>(),
        get<ReminderOnWeekendsUseCase>(),
        get<WeeklyReminderUseCase>(),
        get<DailyReminderUseCase>()));
  }

  static Future<void> setupAppointmentModule() async {
    register(PaymobService());
    if (!isRegistered<UploadImageService>()) {
      register<UploadImageService>(UploadImageService(get<FirebaseStorage>()));
    }
    register<AppointmentDataSource>(AppointmentDataSourceImpl(
        get<PaymobService>(),
        get<FirebaseFirestore>(),
        get<UploadImageService>()));
    register<AppointmentRepository>(
        AppointmentRepoImpl(get<AppointmentDataSource>(), get<NetworkInfo>()));
    register<CreateAppointmentUseCase>(
        CreateAppointmentUseCase(get<AppointmentRepository>()));
    register<CreatePaymentKeyUsecase>(
        CreatePaymentKeyUsecase(get<AppointmentRepository>()));
    register<SetPaymentStatusUsecase>(
        SetPaymentStatusUsecase(get<AppointmentRepository>()));
    register<CancelAppointmentUseCase>(
        CancelAppointmentUseCase(get<AppointmentRepository>()));
    register<AppointmentCubit>(AppointmentCubit(
      get<CreateAppointmentUseCase>(),
      get<CreatePaymentKeyUsecase>(),
      get<SetPaymentStatusUsecase>(),
      get<CancelAppointmentUseCase>(),
    ));
  }

  static void setupAppointmentDetailsModule(AppointmentEntity appointment) {
    setupAppointmentModule();
    get<AppointmentCubit>().setAppointmentEntity = appointment;
  }

  static Future<void> logout() async {
    final appPreferences = get<AppPreferences>();
    if (appPreferences.isCoach()) {
      get<CoachCubit>().clear();
      get<CoachModuleController>().clear();
      await appPreferences.logout();
      return;
    }
    get<HomeCubit>().clear();
    get<ProfileCubit>().clear();
    if (isRegistered<WorkoutsCubit>()) {
      get<WorkoutsCubit>().clear();
    }
    if (isRegistered<CentersCubit>()) {
      get<CentersCubit>().clear();
    }
    if (isRegistered<EditProfileCubit>()) {
      get<EditProfileCubit>().clear();
    }
    if (isRegistered<LayoutController>()) {
      get<LayoutController>().clear();
    }
    await appPreferences.logout();
  }

  static void setupUserSettingsModule() {
    if (!isRegistered<UserSettingsCubit>()) {
      register<UserSettingsDataSource>(
          UserSettingsDataSourceImpl(get<FirebaseAuth>()));
      register<UserSettingsRepository>(UserSettingsRepositoryImpl(
          get<UserSettingsDataSource>(), get<NetworkInfo>()));
      register<ChangeEmailUseCase>(
          ChangeEmailUseCase(get<UserSettingsRepository>()));
      register<ChangePasswordUseCase>(
          ChangePasswordUseCase(get<UserSettingsRepository>()));
      register<SignOutUsecase>(SignOutUsecase(get<UserSettingsRepository>()));
      register<UserSettingsCubit>(UserSettingsCubit(
        get<SignOutUsecase>(),
        get<ChangePasswordUseCase>(),
        get<ChangeEmailUseCase>(),
        get<AppPreferences>(),
      ));
    }
  }

  static Future<void> setupCoachLayoutModule() async {
    setupUserSettingsModule();
    if (!isRegistered<CoachModuleController>()) {
      if (!isRegistered<UploadImageService>()) {
        register<UploadImageService>(
            UploadImageService(get<FirebaseStorage>()));
      }
      register<CoachModuleController>(CoachModuleController());
      register<CoachDataSource>(CoachDataSourceImpl(get<FirebaseAuth>(),
          get<FirebaseFirestore>(), get<UploadImageService>()));
      register<CoachRepository>(
          CoachRepositoryImpl(get<CoachDataSource>(), get<NetworkInfo>()));
      register<GetCoachDataUseCase>(
          GetCoachDataUseCase(get<CoachRepository>()));
      register<GetAppointmentsUseCase>(
          GetAppointmentsUseCase(get<CoachRepository>()));
      register<UpdateCoachDataUseCase>(
          UpdateCoachDataUseCase(get<CoachRepository>()));
      register<CoachCubit>(CoachCubit(get<GetCoachDataUseCase>(),
          get<GetAppointmentsUseCase>(), get<UpdateCoachDataUseCase>()));
    }
    await get<CoachCubit>().initCoachHomeData();
  }
}
