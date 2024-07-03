abstract class UserSettingsDataSource {
  Future<void> updateEmailAddress(String email);

  Future<void> changePassword(String newPassword);

  Future<void> signOut();
}
