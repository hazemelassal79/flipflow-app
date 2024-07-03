import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/enums.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/reminder/domain/usecase/reminder_usecase/daily_reminder_usecase.dart';
import 'package:flipflow_app/features/reminder/domain/usecase/reminder_usecase/specifc_days_reminder_usecase.dart';
import 'package:flipflow_app/features/reminder/domain/usecase/reminder_usecase/weekly_reminder_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit(this._monAndFriUseCase, this._weekendUseCase,
      this._weeklyReminderUseCase, this._dailyReminderUseCase)
      : super(ReminderInitial());

  final ReminderOnMonAndFriUseCase _monAndFriUseCase;
  final ReminderOnWeekendsUseCase _weekendUseCase;
  final WeeklyReminderUseCase _weeklyReminderUseCase;
  final DailyReminderUseCase _dailyReminderUseCase;

  late String _time;

  late String _repeatOption;

  set time(String time) => _time = time;

  set repeatOption(String option) => _repeatOption = option;

  Future<void> setReminder() async {
    Either<Failure, void> data;
    switch (_repeatOption) {
      case "Everyday":
        data =
            await _dailyReminderUseCase.execute(_time.timeStringToDateTime());
        break;
      case "Weekend":
        data = await _weekendUseCase.execute(_time.timeStringToDateTime());
        break;
      case "Mon-Fri":
        data = await _monAndFriUseCase.execute(_time.timeStringToDateTime());
        break;
      default:
        DaysOfWeek day = parseDayOfWeek(_repeatOption)!;
        data = await _weeklyReminderUseCase.execute(WeeklyReminderUseCaseInput(
            day: day, time: _time.timeStringToDateTime()));
    }

    if (data.isRight()) {
      emit(SetReminderSuccsessSate());
      return;
    }

    emit(SetReminderErrorState(data.failure.toString()));
  }
}
