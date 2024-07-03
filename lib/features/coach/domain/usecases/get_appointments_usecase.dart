import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/coach/domain/repo/coach_repo.dart';

class GetAppointmentsUseCase
    extends BaseUseCase<void, List<AppointmentEntity>> {
  final CoachRepository _coachRepository;

  GetAppointmentsUseCase(this._coachRepository);
  @override
  Future<Either<Failure, List<AppointmentEntity>>> execute([void input]) async {
    return await _coachRepository.getCoachAppointment();
  }
}
