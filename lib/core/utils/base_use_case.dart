import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
