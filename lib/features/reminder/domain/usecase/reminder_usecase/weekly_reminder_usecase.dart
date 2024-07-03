import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/reminder/domain/repo/reminder_repo.dart';

class WeeklyReminderUseCase
    extends BaseUseCase<WeeklyReminderUseCaseInput, void> {
  final ReminderRepository _reminderRepository;

  WeeklyReminderUseCase(this._reminderRepository);

  @override
  Future<Either<Failure, void>> execute(WeeklyReminderUseCaseInput input) async {
    return await _reminderRepository.setWeeklyReminderAtSpecificDayTime(
      day: input.day,
      time: input.time,
    );
  }
}

class WeeklyReminderUseCaseInput {
  DaysOfWeek day;
  DateTime time;

  WeeklyReminderUseCaseInput({required this.day, required this.time});
}
