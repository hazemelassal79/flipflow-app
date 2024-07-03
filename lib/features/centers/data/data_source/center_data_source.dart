import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';
import 'package:flipflow_app/features/centers/data/models/coaches_filter_model.dart';

abstract class CentersDataSource {
  Future<List<CenterModel>> getCenters(String query);

  Future<CenterModel> getCenterDetails(String centerId);

  Future<List<CoachModel>> getCoachesOfGymnasticType(CoachesFilterModel filter);
}
