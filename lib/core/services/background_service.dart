import 'package:flipflow_app/core/utils/enums.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundService {
  Duration _getInitialDelayOfDailyNotification(DateTime time) {
    DateTime now = DateTime.now();

    if (now.isBefore(time)) {
      return time.difference(now);
    }
    DateTime desiredTimeTomorrow = time.add(const Duration(days: 1));
    return desiredTimeTomorrow.difference(now);
  }

  Future<void> sendDailyNotificationAtSpecificTime(DateTime time) async {
    _cancelAllNotification();

    Workmanager().registerPeriodicTask(
      DateTime.now().toString(),
      NotificationStatus.dailyNotification.name,
      initialDelay: _getInitialDelayOfDailyNotification(time),
      frequency: const Duration(days: 1),
    );
  }

  Duration _getInitialDelayOfWeeklyNotification(DaysOfWeek day, DateTime time) {
    DateTime now = DateTime.now();

    if (now.weekday < day.dateTimeValue ||
        (now.weekday == day.dateTimeValue && now.isBefore(time))) {
      DateTime desiredDateTime = DateTime(now.year, now.month,
          now.day + (day.dateTimeValue - now.weekday), time.hour, time.minute);
      return desiredDateTime.difference(now);
    }
    DateTime desiredDateTime = DateTime(
        now.year,
        now.month,
        now.day + (7 - (now.weekday - day.dateTimeValue)),
        time.hour,
        time.minute);
    return desiredDateTime.difference(now);
  }

  Future<void> sendWeeklyNotificationAtSpecificDayTime({
    required DaysOfWeek day,
    required DateTime time,
  }) async {
    _cancelAllNotification();

    Workmanager().registerPeriodicTask(
      DateTime.now().toString() + day.name,
      NotificationStatus.dailyNotification.name,
      initialDelay: _getInitialDelayOfWeeklyNotification(day, time),
      frequency: const Duration(days: 7),
    );
  }

  Future<void> sendNotificationsOnMonAndFri(DateTime time) {
    return _sendWeeklyNotificationOn2Days(
        dayOne: DaysOfWeek.fri, dayTwo: DaysOfWeek.mon, time: time);
  }

  Future<void> sendNotificationsOnWeekends(DateTime time) {
    return _sendWeeklyNotificationOn2Days(
        dayOne: DaysOfWeek.fri, dayTwo: DaysOfWeek.sat, time: time);
  }

  Future<void> _sendWeeklyNotificationOn2Days({
    required DaysOfWeek dayOne,
    required DaysOfWeek dayTwo,
    required DateTime time,
  }) async {
    sendWeeklyNotificationAtSpecificDayTime(day: dayOne, time: time);

    sendWeeklyNotificationAtSpecificDayTime(day: dayTwo, time: time);
  }

  Future<void> _cancelAllNotification() async {
    Workmanager().cancelAll();
  }
}
