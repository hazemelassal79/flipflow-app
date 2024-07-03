


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/user_settings/data/data_source/user_settings_data_source.dart';
import 'package:flipflow_app/features/user_settings/domain/repo/user_settings_repo.dart';

class UserSettingsRepositoryImpl implements UserSettingsRepository {

  final UserSettingsDataSource _dataSource;
  final NetworkInfo _networkInfo;

  UserSettingsRepositoryImpl(this._dataSource, this._networkInfo);


  @override
  Future<Either<Failure, String>> changePassword(String newPassword) async {
    try {
      if (await _networkInfo.isConnected) {
        await _dataSource.changePassword(newPassword);

        return const Right(AppStrings.passwordChanged);
      } else {
        return Left(Failure.connectionFailure());
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateEmailAddress(String email) async {
    try {
      if (await _networkInfo.isConnected) {
        await _dataSource.updateEmailAddress(email);
        return const Right(AppStrings.newEmailVerificationSent);
      } else {
        return Left(Failure.connectionFailure());
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      if (await _networkInfo.isConnected) {
        return Right(await _dataSource.signOut());
      } else {
        return Left(Failure.connectionFailure());
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

}