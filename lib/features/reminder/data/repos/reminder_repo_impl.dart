// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/services/background_service.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/reminder/domain/repo/reminder_repo.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  ReminderRepositoryImpl(this._backgroundService);
  final BackgroundService _backgroundService;
  @override
  Future<Either<Failure, void>> setDailyReminderAtSpecificTime(
      DateTime time) async {
    try {
      await _backgroundService.sendDailyNotificationAtSpecificTime(time);
      return const Right(0);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setReminderOnMonAndFri(DateTime time) async {
    try {
      await _backgroundService.sendNotificationsOnMonAndFri(time);
      return const Right(0);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setReminderOnWeekends(DateTime time) async {
    try {
      await _backgroundService.sendNotificationsOnWeekends(time);
      return const Right(0);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setWeeklyReminderAtSpecificDayTime(
      {required DaysOfWeek day, required DateTime time}) async {
    try {
      await _backgroundService.sendWeeklyNotificationAtSpecificDayTime(
          day: day, time: time);
      return const Right(0);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }
}
