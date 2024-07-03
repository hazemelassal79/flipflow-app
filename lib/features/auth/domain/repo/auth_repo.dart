import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> createUserAccount(UserEntity userModel);

  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> sendPasswordResetEmail({
    required String email,
  });

  Future<Either<Failure, CoachEntity>> coachSignIn(
      {required String email, required String password});
}
