import 'package:flipflow_app/core/models/coach/coach_model.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> createUserAccount(UserModel userModel);

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<CoachModel> signInAsCoach(
      {required String email, required String password});

  Future<void> sendPasswordResetEmail(String email);
}
