import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/appointment/domain/repo/appointment_repo.dart';

class CancelAppointmentUseCase extends BaseUseCase<String, void> {
  final AppointmentRepository _appointmentRepository;
  CancelAppointmentUseCase(this._appointmentRepository);
  @override
  Future<Either<Failure, void>> execute(String input) async {
    return _appointmentRepository.cancelAppointment(input);
  }
}
