import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

extension Validations on String? {
  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this ?? '');
  }

  bool isValidPassword() {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    ).hasMatch(this ?? '');
  }

  bool isValidPhoneNumber() {
    return RegExp(r'^01([0-2]|5)\d{1,8}$').hasMatch(this ?? '');
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    }

    return this!;
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    }

    return this!;
  }
}

extension EitherX<Failure, R> on Either<Failure, R> {
  R get right => (this as Right<Failure, R>).value;
  Failure get failure => (this as Left<Failure, R>).value;
}

///Converts String time in format HH:MM AM/PM to DateTime
extension StringToDateTime on String {
  ///Parses String to DateTime if there's an error
  ///It returns current date time
  DateTime toDateTime() {
    final date = DateTime.tryParse(this);

    if (date == null) {
      return DateFormat.yMMMEd().tryParse(this) ?? DateTime.now();
    }
    return date;
  }

  ///Converts String time in format HH:MM AM/PM to DateTime
  ///If there's no [date] passed, it will use current date
  DateTime timeStringToDateTime([DateTime? date]) {
    List<String> parts = split(' ');

    List<String> hourAndMinute = parts[0].split(':');
    int hour = int.parse(hourAndMinute[0]);
    int minute = int.parse(hourAndMinute[1]);

    bool isPM = parts[1].toLowerCase() == 'pm';

    if (isPM && hour != 12) {
      hour += 12;
    } else if (!isPM && hour == 12) {
      hour = 0;
    }

    DateTime now = DateTime.now();
    date ??= now;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}

extension FormattedDateTime on DateTime {
  int get formattedHour =>
      int.parse(DateFormat('hh:mm a').format(this).split(':')[0]);

  int get formattedMinute =>
      int.parse(DateFormat('hh:mm a').format(this).split(':')[1].split(' ')[0]);

  String get amPm =>
      (DateFormat('hh:mm a').format(this).split(' ')[1]).toUpperCase();

  String toFormattedTime() {
    return DateFormat('hh:mm a').format(this);
  }

  String toFormattedDate() {
    return DateFormat.yMMMEd().format(this);
  }
}
