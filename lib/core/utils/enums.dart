enum NotificationStatus {
  dailyNotification,
  weekendNotification,
  monFriNotification,
  oneDayNotification
}

extension NotificationStatusExtension on NotificationStatus {
  String get name {
    switch (this) {
      case NotificationStatus.dailyNotification:
        return "daily";
      case NotificationStatus.weekendNotification:
        return "weekend";
      case NotificationStatus.monFriNotification:
        return "mon-fri";
      case NotificationStatus.oneDayNotification:
        return "one-day";
    }
  }
}

enum DaysOfWeek { mon, tue, wed, thu, fri, sat, sun }

extension DaysOfWeekExtension on DaysOfWeek? {
  int get dateTimeValue {
    switch (this) {
      case DaysOfWeek.mon:
        return DateTime.monday;
      case DaysOfWeek.tue:
        return DateTime.tuesday;
      case DaysOfWeek.wed:
        return DateTime.wednesday;
      case DaysOfWeek.thu:
        return DateTime.thursday;
      case DaysOfWeek.fri:
        return DateTime.friday;
      case DaysOfWeek.sat:
        return DateTime.saturday;
      case DaysOfWeek.sun:
        return DateTime.sunday;
      default:
        return 0;
    }
  }
}

DaysOfWeek? parseDayOfWeek(String day) {
  switch (day.toLowerCase()) {
    case 'mon':
      return DaysOfWeek.mon;
    case 'tue':
      return DaysOfWeek.tue;
    case 'wed':
      return DaysOfWeek.wed;
    case 'thu':
      return DaysOfWeek.thu;
    case 'fri':
      return DaysOfWeek.fri;
    case 'sat':
      return DaysOfWeek.sat;
    case 'sun':
      return DaysOfWeek.sun;
    default:
      return null;
  }
}
