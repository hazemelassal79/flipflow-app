import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:flipflow_app/features/profile/data/requests/update_user_request.dart';
import 'package:flipflow_app/features/profile/domain/repo/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource _dataSource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, UserModel>> updateUserProfile(
      UpdateUserProfileRequest userRequest) async {
    try {
      if (await _networkInfo.isConnected) {
        final user = await _dataSource.updateUserProfile(userRequest);
        return Right(user);
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
