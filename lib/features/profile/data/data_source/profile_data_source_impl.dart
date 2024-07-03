import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipflow_app/core/models/user/user_model.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/services/upload_image_service.dart';
import 'package:flipflow_app/core/utils/failure.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';
import 'package:flipflow_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:flipflow_app/features/profile/data/requests/update_user_request.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firebaseFirestore;
  final UploadImageService _imageService;
  ProfileDataSourceImpl(
      this._auth, this._firebaseFirestore, this._imageService);
  @override
  Future<UserModel> updateUserProfile(
      UpdateUserProfileRequest userRequest) async {
    if (_auth.currentUser == null) {
      throw Failure(message: AppStrings.unauthorized);
    }
    final uid = _auth.currentUser!.uid;
    final doc = _firebaseFirestore
        .collection(FirebaseConstants.usersCollectionPath)
        .doc(uid);

    if (userRequest.image != null) {
      final imageUrl = await _imageService.uploadImage(userRequest.image!, uid);
      userRequest = userRequest.copyWith(imageUrl: imageUrl);
      await doc.update(userRequest.toJson());

    }else{
      await doc.update({'username': userRequest.username});
    }

    final newUserDoc = await doc.get();
    return UserModel.fromJson(newUserDoc.data() ?? {});
  }
}
