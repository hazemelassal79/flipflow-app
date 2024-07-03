import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flipflow_app/core/utils/firebase_constants.dart';

class UploadImageService {
  final FirebaseStorage _firebaseStorage;

  UploadImageService(this._firebaseStorage);

  Future<String> uploadImage(File image, String uid) async {
    Reference ref = _firebaseStorage
        .ref()
        .child('${FirebaseConstants.profilePictureDirPath}/$uid');

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
