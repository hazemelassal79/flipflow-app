import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/appointment/trainee_model.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/services/upload_image_service.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';
import 'package:flipflow_app/features/coach/data/data_source/coach_data_source.dart';
import 'package:flipflow_app/features/coach/data/requests/update_coach_model.dart';

class CoachDataSourceImpl implements CoachDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final UploadImageService _imageService;

  CoachDataSourceImpl(this._auth, this._firestore, this._imageService);

  @override
  Future<List<AppointmentModel>> getCoachAppointments() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    var appointments = (await _firestore
            .collection(FirebaseConstants.appointmentsCollectionPath)
            .where('coachId', isEqualTo: user.uid)
            .get())
        .docs;

    appointments = appointments
        .where((element) => element['trainingTime']
            .toString()
            .toDateTime()
            .isAfter(DateTime.now()))
        .toList();

    List<AppointmentModel> appointmentModels = [];
    for (var element in appointments) {
      final trainee = await _firestore
          .collection(FirebaseConstants.traineesCollectionPath)
          .doc(element.data()['traineeId'])
          .get();
      final centerDoc = _firestore
          .collection(FirebaseConstants.centersCollectionPath)
          .doc(element.data()['centerId']);

      final center = await centerDoc.get();

      final gymnasticsType = await centerDoc
          .collection(FirebaseConstants.gymnasticsTypeCollectionPath)
          .doc(element.data()['gymnasticTypeId'])
          .get();

      final coach = await _firestore
          .collection(FirebaseConstants.coachesCollectionPath)
          .doc(element.data()['coachId'])
          .get();

      appointmentModels.add(AppointmentModel.fromJson(element.data()).copyWith(
        trainee: TraineeModel.fromJson(trainee.data() ?? {}),
        center: CenterModel.fromJson(center.data() ?? {}),
        coach: CoachModel.fromJson(coach.data() ?? {}),
        gymnasticType: GymnasticTypeModel.fromJson(gymnasticsType.data()!),
      ));
    }

    return appointmentModels;
  }

  @override
  Future<CoachModel> getCoachData() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    final data = await _firestore
        .collection(FirebaseConstants.coachesCollectionPath)
        .doc(user.uid)
        .get();
    final coach = CoachModel.fromJson(data.data()!);
    return coach.copyWith(email: user.email);
  }

  @override
  Future<CoachModel> updateCoachData(
      UpdateCoachDataRequest coachDataRequest) async {
    if (_auth.currentUser == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    final uid = _auth.currentUser!.uid;

    if (coachDataRequest.image != null) {
      final imageUrl =
          await _imageService.uploadImage(coachDataRequest.image!, uid);
      coachDataRequest = coachDataRequest.copyWith(imageUrl: imageUrl);
    }

    final doc =
        _firestore.collection(FirebaseConstants.coachesCollectionPath).doc(uid);

    var jsonCoachData = coachDataRequest.toJson();
    if (coachDataRequest.image != null) {
      jsonCoachData['imageUrl'] = coachDataRequest.imageUrl;
    }

    await doc.update(jsonCoachData);

    final newCoachDoc = await doc.get();
    return CoachModel.fromJson(newCoachDoc.data() ?? {});
  }
}
