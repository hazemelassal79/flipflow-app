class CoachModel {
  final String? uid;
  final String? name;
  final String? imageUrl;
  final String? email;
  final int? experience;
  final String? phoneNumber;

  const CoachModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.imageUrl,
    required this.experience,
    required this.phoneNumber,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
        uid: json['uid'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        experience: json['experience'] as int?,
        phoneNumber: json['phoneNumber'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'imageUrl': imageUrl,
      'experience': experience,
      'phoneNumber': phoneNumber
    };
  }

  CoachModel copyWith({
    String? uid,
    String? name,
    String? imageUrl,
    String? email,
    int? experience,
    String? phoneNumber,
  }) {
    return CoachModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      email: email ?? this.email,
      experience: experience ?? this.experience,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
