import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/appointment/domain/repo/appointment_repo.dart';

class SetPaymentStatusUsecase extends BaseUseCase<String, void> {
  final AppointmentRepository _repository;

  SetPaymentStatusUsecase(this._repository);

  @override
  Future<Either<Failure, void>> execute(String input) async {
    return await _repository.setAppointmentPaymentStatus(input);
  }
}
