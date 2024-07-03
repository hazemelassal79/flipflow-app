part of 'reminder_cubit.dart';

sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

final class SetReminderSuccsessSate extends ReminderState {}

final class SetReminderErrorState extends ReminderState {
  final String message;

  SetReminderErrorState(this.message);
}
