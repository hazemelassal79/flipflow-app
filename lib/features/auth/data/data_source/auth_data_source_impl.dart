import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/auth/data/data_source/auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<UserModel> createUserAccount(UserModel userModel) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email!, password: userModel.password!);

    if (credential.user == null) {
      throw Failure(message: AppStrings.signUpError);
    }

    final uid = credential.user!.uid;
    userModel = userModel.copyWith(uid: uid);
    await _firestore
        .collection(FirebaseConstants.usersCollectionPath)
        .doc(uid)
        .set(userModel.toJson());

    return userModel;
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    final uid = credential.user?.uid;
    final user = await _findUserWithUid(uid);
    user.copyWith(email: credential.user?.email);
    return user;
  }

  Future<UserModel> _findUserWithUid(String? uid) async {
    final user = await _firestore
        .collection(FirebaseConstants.usersCollectionPath)
        .doc(uid)
        .get();

    final data = user.data();

    if (data == null) {
      throw Failure(message: AppStrings.userNotExists);
    }
    return UserModel.fromJson(data);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<CoachModel> signInAsCoach(
      {required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final uid = credential.user?.uid;

    final coach = await _findCoachWithUid(uid);
    coach.copyWith(email: credential.user?.email);
    return coach;
  }

  Future<CoachModel> _findCoachWithUid(String? uid) async {
    final coach = await _firestore
        .collection(FirebaseConstants.coachesCollectionPath)
        .doc(uid)
        .get();
    final data = coach.data();
    if (data == null) {
      throw Failure(message: AppStrings.userNotExists);
    }
    return CoachModel.fromJson(data);
  }
}
