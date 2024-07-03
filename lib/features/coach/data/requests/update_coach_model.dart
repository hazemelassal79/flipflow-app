import 'dart:io';

class UpdateCoachDataRequest {
  final String? name;
  final String? phoneNumber;
  final File? image;
  final String? imageUrl;

  UpdateCoachDataRequest({
    required this.name,
    required this.imageUrl,
    required this.phoneNumber,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  copyWith({
    String? name,
    String? imageUrl,
    String? phoneNumber,
  }) {
    return UpdateCoachDataRequest(
      name: name ?? this.name,
      image: image,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
