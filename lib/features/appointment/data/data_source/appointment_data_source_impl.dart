import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/services/paymob_service.dart';
import 'package:flipflow_app/core/services/upload_image_service.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/appointment/data/data_source/appointment_data_source.dart';
import 'package:flipflow_app/features/appointment/data/models/appointment_request.dart';
import 'package:flipflow_app/features/appointment/data/models/user_billing_data_model.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';

class AppointmentDataSourceImpl extends AppointmentDataSource {
  final PaymobService _paymobService;
  final FirebaseFirestore _firestore;
  final UploadImageService _uploadImageService;

  AppointmentDataSourceImpl(
      this._paymobService, this._firestore, this._uploadImageService);

  @override
  Future<AppointmentModel> createAppointment(
      AppointmentRequest appointmentRequest) async {
    final traineeDoc = await _firestore
        .collection(FirebaseConstants.traineesCollectionPath)
        .add(appointmentRequest.trainee!.toJson());

    if (appointmentRequest.trainee?.image != null) {
      final imageUrl = await _uploadImageService.uploadImage(
          appointmentRequest.trainee!.image!, traineeDoc.id);
      await traineeDoc.update({"imageUrl": imageUrl});
    }

    await traineeDoc.update({"uid": traineeDoc.id});
    final doc = await _firestore
        .collection(FirebaseConstants.appointmentsCollectionPath)
        .add(appointmentRequest.toJson());

    await doc.update({"appointmentId": doc.id, "traineeId": traineeDoc.id});

    final centerDoc = _firestore
        .collection(FirebaseConstants.centersCollectionPath)
        .doc(appointmentRequest.centerId);

    final center = await centerDoc.get();

    final gymnasticsType = await centerDoc
        .collection(FirebaseConstants.gymnasticsTypeCollectionPath)
        .doc(appointmentRequest.gymnasticTypeId)
        .get();

    final coach = await _firestore
        .collection(FirebaseConstants.coachesCollectionPath)
        .doc(appointmentRequest.coachId)
        .get();

    final docData = await doc.get();

    return AppointmentModel.fromJson(docData.data() ?? {}).copyWith(
      trainee: appointmentRequest.trainee?.copyWith(uid: traineeDoc.id),
      center: CenterModel.fromJson(center.data() ?? {}),
      coach: CoachModel.fromJson(coach.data() ?? {}),
      gymnasticType: GymnasticTypeModel.fromJson(gymnasticsType.data() ?? {}),
    );
  }

  @override
  Future<String> createPaymentKey(
      UserBillingDataRequest userBillingDataModel) async {
    final paymentKey = await _paymobService.createPaymentKey(
        userBillingData: userBillingDataModel.toJson());

    return paymentKey;
  }

  @override
  Future<void> setPaymentStatus(String appointmentId) async {
    await _firestore
        .collection(FirebaseConstants.appointmentsCollectionPath)
        .doc(appointmentId)
        .update({"paymentStatus": "paid"});
  }

  @override
  Future<void> cancelAppointment(String appointmentId) async {
    final appointmentDoc = _firestore
        .collection(FirebaseConstants.appointmentsCollectionPath)
        .doc(appointmentId);
    final appointmentData = await appointmentDoc.get();
    if (!appointmentData.exists) {
      throw Failure(message: AppStrings.email);
    }
    await _firestore
        .collection(FirebaseConstants.traineesCollectionPath)
        .doc(appointmentData['traineeId'])
        .delete();
    await appointmentDoc.delete();
  }
}
