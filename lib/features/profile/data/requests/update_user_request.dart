import 'dart:io';

class UpdateUserProfileRequest {
  String? username;
  String? imageUrl;
  File? image;

  UpdateUserProfileRequest({required this.username, this.image, this.imageUrl});

  Map<String, dynamic> toJson() {
    return {'username': username, 'imageUrl': imageUrl};
  }

  UpdateUserProfileRequest copyWith({String? username, String? imageUrl}) {
    return UpdateUserProfileRequest(
        username: username ?? this.username,
        imageUrl: imageUrl ?? this.imageUrl);
  }
}
