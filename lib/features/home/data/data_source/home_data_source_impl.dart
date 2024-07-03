import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipflow_app/core/models/appointment/appointment_model.dart';
import 'package:flipflow_app/core/models/appointment/trainee_model.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/models/workout/workout_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/extensions.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/centers/data/models/center_model.dart';
import 'package:flipflow_app/features/home/data/data_source/home_data_source.dart';

class HomeDataSourceImpl implements HomeDataSource {
  HomeDataSourceImpl(this._firebaseFirestore, this._auth);

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;

  @override
  Future<List<AppointmentModel>> getUserAppointments() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    var appointments = (await _firebaseFirestore
            .collection(FirebaseConstants.appointmentsCollectionPath)
            .where('userId', isEqualTo: user.uid)
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
      final trainee = await _firebaseFirestore
          .collection(FirebaseConstants.traineesCollectionPath)
          .doc(element.data()['traineeId'])
          .get();
      final centerDoc = _firebaseFirestore
          .collection(FirebaseConstants.centersCollectionPath)
          .doc(element.data()['centerId']);

      final center = await centerDoc.get();

      final gymnasticsType = await centerDoc
          .collection(FirebaseConstants.gymnasticsTypeCollectionPath)
          .doc(element.data()['gymnasticTypeId'])
          .get();

      final coach = await _firebaseFirestore
          .collection(FirebaseConstants.coachesCollectionPath)
          .doc(element.data()['coachId'])
          .get();

      appointmentModels.add(AppointmentModel.fromJson(element.data()).copyWith(
        trainee: TraineeModel.fromJson(trainee.data() ?? {}),
        center: CenterModel.fromJson(center.data() ?? {}),
        coach: CoachModel.fromJson(coach.data() ?? {}),
        gymnasticType: GymnasticTypeModel.fromJson(gymnasticsType.data() ?? {}),
      ));
    }

    return appointmentModels;
  }

  @override
  Future<List<WorkoutModel>> getNewWorkouts() async {
    final data = await _firebaseFirestore
        .collection(FirebaseConstants.workoutCollectionPath)
        .get();

    final workouts = data.docs.map((doc) => WorkoutModel.fromJson(doc.data()));
    return workouts.where((element) {
      return DateTime.now()
              .difference(element.createdAt ?? DateTime.now())
              .inDays <=
          7;
    }).toList();
  }

  @override
  Future<UserModel> getUserData() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Failure(message: AppStrings.unauthorized);
    }

    final user = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollectionPath)
        .doc(currentUser.uid)
        .get();

    log(currentUser.uid);
    if (!user.exists) {
      throw Failure(message: AppStrings.userNotExists);
    }

    final userModel = UserModel.fromJson(user.data() ?? {});

    return userModel.copyWith(
      email: _auth.currentUser?.email,
    );
  }
}
