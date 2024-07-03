import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/centers/data/data_source/center_data_source.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';
import 'package:flipflow_app/features/centers/data/models/coaches_filter_model.dart';

class CentersDataSourceImpl implements CentersDataSource {
  final FirebaseFirestore _firestore;

  CentersDataSourceImpl(this._firestore);

  @override
  Future<CenterModel> getCenterDetails(String id) async {
    final centerDoc =
        _firestore.collection(FirebaseConstants.centersCollectionPath).doc(id);
    final docData = await centerDoc.get();
    final scheduleData = await centerDoc
        .collection(FirebaseConstants.scheduleCollectionPath)
        .get();
    final gymnasticTypeData = await centerDoc
        .collection(FirebaseConstants.gymnasticsTypeCollectionPath)
        .get();

    final center = CenterModel.fromJson(docData.data() ?? {});

    return center.copyWith(
        schedule: scheduleData.docs
            .map((doc) => CenterScheduleDayModel.fromJson(doc.data()))
            .toList(),
        gymnasticTypes: gymnasticTypeData.docs
            .map((doc) => GymnasticTypeModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<List<CenterModel>> getCenters(String query) async {
    final data = await _firestore
        .collection(FirebaseConstants.centersCollectionPath)
        .get();

    final centers =
        data.docs.map((e) => CenterModel.fromJson(e.data())).toList();

    if (query.isNotEmpty) {
      return centers
          .where((element) =>
              (element.name?.toLowerCase().contains(query.toLowerCase())) ??
              false)
          .toList();
    }

    return centers;
  }

  @override
  Future<List<CoachModel>> getCoachesOfGymnasticType(
      CoachesFilterModel filter) async {
    if (filter.coachesIds.isEmpty) {
      throw Failure(message: AppStrings.noCoachesFound);
    }
    final coachesQury = await _firestore
        .collection(FirebaseConstants.coachesCollectionPath)
        .where(FieldPath.documentId, whereIn: filter.coachesIds)
        .get();

    final coaches =
        coachesQury.docs.map((doc) => CoachModel.fromJson(doc.data())).toList();

    if (filter.query.isNotEmpty) {
      return coaches
          .where((element) =>
              element.name
                  ?.toLowerCase()
                  .contains(filter.query.toLowerCase()) ??
              false)
          .toList();
    }

    return coaches;
  }
}
