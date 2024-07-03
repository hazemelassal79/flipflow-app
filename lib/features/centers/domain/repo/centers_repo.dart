import 'package:dartz/dartz.dart';
import 'package:flipflow_app/core/entities/coach_entity.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/centers/domain/entity/centers_entity.dart';
import 'package:flipflow_app/features/centers/domain/entity/coaches_filter_entity.dart';

abstract class CentersRepository {
  Future<Either<Failure, List<CenterEntity>>> getCenters(String query);

  Future<Either<Failure, CenterEntity>> getCenterDetails(String centerId);

  Future<Either<Failure, List<CoachEntity>>> getCoachesOfGymnasticType(
      CoachesFilterEntity filter);
}
