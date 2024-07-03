// ignore_for_file: void_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/entities/user_entity.dart';
import 'package:flipflow_app/core/models/mapper/coaches_mapper.dart';
import 'package:flipflow_app/core/models/mapper/user_mapper.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:flipflow_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSource, this._networkInfo);

  final AuthDataSource _authDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = await _authDataSource.signInWithEmailAndPassword(
            email: email, password: password);
        return Right(data.toUserEntity());
      } on FirebaseException catch (error) {
        return Left(Failure(message: error.message ?? ''));
      } catch (error) {
        return Left(Failure(message: error.toString()));
      }
    }
    return Left(Failure.connectionFailure());
  }

  @override
  Future<Either<Failure, UserEntity>> createUserAccount(
      UserEntity userModel) async {
    if (await _networkInfo.isConnected) {
      try {
        final data =
            await _authDataSource.createUserAccount(userModel.toUserModel());
        return Right(data.toUserEntity());
      } on FirebaseException catch (error) {
        return Left(Failure(message: error.message ?? ''));
      } catch (error) {
        return Left(Failure(message: error.toString()));
      }
    }
    return Left(Failure.connectionFailure());
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(
      {required String email}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _authDataSource.sendPasswordResetEmail(email);
        return const Right(AppStrings.resetPasswordLinkWasSent);
      } on FirebaseException catch (error) {
        return Left(Failure(message: error.message ?? ''));
      } catch (error) {
        return Left(Failure(message: error.toString()));
      }
    }
    return Left(Failure.connectionFailure());
  }

  @override
  Future<Either<Failure, CoachEntity>> coachSignIn(
      {required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = await _authDataSource.signInAsCoach(
            email: email, password: password);
        return Right(data.toCoachEntity());
      } on FirebaseException catch (error) {
        return Left(Failure(message: error.message ?? ''));
      } catch (error) {
        return Left(Failure(message: error.toString()));
      }
    }
    return Left(Failure.connectionFailure());
  }
}
