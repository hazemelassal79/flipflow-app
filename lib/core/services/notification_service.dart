import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService(this._notificationsPlugin);
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  Future<void> init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showReminderNotification() async {
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
          DateTime.now().toString(),"${DateTime.now().toString()}Channel",
          importance: Importance.max),
      iOS: const DarwinNotificationDetails(),
    );

    await _notificationsPlugin.show(
        0, "Don't forget your workout today🏋️", ' Remember, progress happens one workout at a time!⏱️', details,
        payload: 'item x');
  }
}
