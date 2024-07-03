import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/base_use_case.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/appointment/domain/entities/user_billing_data_entity.dart';
import 'package:flipflow_app/features/appointment/domain/repo/appointment_repo.dart';

class CreatePaymentKeyUsecase
    extends BaseUseCase<CreatePaymentKeyUsecaseInput, String> {
  final AppointmentRepository _repository;

  CreatePaymentKeyUsecase(this._repository);

  @override
  Future<Either<Failure, String>> execute(
      CreatePaymentKeyUsecaseInput input) async {
    return await _repository.createPaymentKey(input);
  }
}

class CreatePaymentKeyUsecaseInput extends UserBillingDataEntity {
  CreatePaymentKeyUsecaseInput(
      {required super.name,
      required super.email,
      required super.phoneNumber,
      required super.price});
}
