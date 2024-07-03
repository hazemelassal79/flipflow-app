import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/models/mapper/coaches_mapper.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/network_info.dart';
import 'package:flipflow_app/features/centers/data/data_source/center_data_source.dart';
import 'package:flipflow_app/features/centers/data/mapper/centers_mapper.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/domain/entity/coaches_filter_entity.dart';
import 'package:flipflow_app/features/centers/domain/repo/centers_repo.dart';

class CentersRepositoryImpl implements CentersRepository {
  final CentersDataSource _dataSource;
  final NetworkInfo _networkInfo;

  CentersRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CenterEntity>> getCenterDetails(
      String centerId) async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _dataSource.getCenterDetails(centerId);
        return Right(data.toCenterEntity());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CenterEntity>>> getCenters(String query) async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _dataSource.getCenters(query);
        return Right(data.map((e) => e.toCenterEntity()).toList());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoachEntity>>> getCoachesOfGymnasticType(
      CoachesFilterEntity filter) async {
    try {
      if (await _networkInfo.isConnected) {
        final data = await _dataSource
            .getCoachesOfGymnasticType(filter.toCoachesFilterModel());
        return Right(data.map((e) => e.toCoachEntity()).toList());
      }
      return Left(Failure.connectionFailure());
    } on FirebaseException catch (error) {
      return Left(Failure(message: error.message ?? ''));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
