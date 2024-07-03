import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/reminder/domain/repo/reminder_repo.dart';

class ReminderOnMonAndFriUseCase extends BaseUseCase<DateTime, void> {
  final ReminderRepository _reminderRepository;

  ReminderOnMonAndFriUseCase(this._reminderRepository);

  @override
  Future<Either<Failure, void>> execute(DateTime input) async {
    return await _reminderRepository.setReminderOnMonAndFri(input);
  }
}

class ReminderOnWeekendsUseCase extends BaseUseCase<DateTime, void> {
  final ReminderRepository _reminderRepository;

  ReminderOnWeekendsUseCase(this._reminderRepository);

  @override
  Future<Either<Failure, void>> execute(DateTime input) async {
    return await _reminderRepository.setReminderOnWeekends(input);
  }
}
