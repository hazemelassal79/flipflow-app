import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/failure.dart';

abstract class ReminderRepository {
  Future<Either<Failure, void>> setDailyReminderAtSpecificTime(
      DateTime time);

  Future<Either<Failure, void>> setWeeklyReminderAtSpecificDayTime({
    required DaysOfWeek day,
    required DateTime time,
  });

  Future<Either<Failure, void>> setReminderOnMonAndFri(DateTime time);

  Future<Either<Failure, void>> setReminderOnWeekends(DateTime time);
}
