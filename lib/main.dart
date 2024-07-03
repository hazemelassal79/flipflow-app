import 'package:firebase_core/firebase_core.dart';
import 'package:flipflow_app/app.dart';
import 'package:flipflow_app/bloc_observer.dart';
import 'package:flipflow_app/core/di/di.dart';
import 'package:flipflow_app/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final notification =
        LocalNotificationService(FlutterLocalNotificationsPlugin());
    await notification.init();
    notification.showReminderNotification();
    return Future.value(true);
  });
}

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServiceLocator.setup();
  runApp(MyApp());
}
