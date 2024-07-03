import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/features/user_settings/data/data_source/user_settings_data_source.dart';

class UserSettingsDataSourceImpl extends UserSettingsDataSource {
  final FirebaseAuth _auth;

  UserSettingsDataSourceImpl(this._auth);

  @override
  Future<void> updateEmailAddress(String email) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    await user.verifyBeforeUpdateEmail(email);
  }

  @override
  Future<void> changePassword(String newPassword) async {
    final user = _auth.currentUser!;
    if (_auth.currentUser == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    await user.updatePassword(newPassword);
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
