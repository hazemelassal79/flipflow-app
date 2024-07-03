import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/utils/failure.dart';

abstract class UserSettingsRepository {
  Future<Either<Failure, String>> updateEmailAddress(String email);
  Future<Either<Failure, String>> changePassword(String newPassword);
  Future<Either<Failure, void>> signOut();
}
