import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/appointment_entity.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/home/domain/repo/home_repository.dart';

class GetUserAppointmentUseCase
    extends BaseUseCase<void, List<AppointmentEntity>> {
  final HomeRepository _homeRepository;

  GetUserAppointmentUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<AppointmentEntity>>> execute([void input]) async {
    return await _homeRepository.getUserAppointments();
  }
}
