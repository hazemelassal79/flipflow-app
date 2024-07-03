import 'dart:io';

class TraineeModel {
  final String? name;
  final String? email;
  final String? imageUrl;
  final String? uid;
  final String? phoneNumber;
  final int? age;
  final File? image;

  factory TraineeModel.fromJson(Map<String, dynamic> json) {
    return TraineeModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
      imageUrl: json['imageUrl'] as String?,
      uid: json['uid'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  TraineeModel(
      {required this.name,
      required this.age,
      required this.email,
      this.image,
      required this.imageUrl,
      required this.uid,
      required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'imageUrl': imageUrl,
      'uid': uid,
      'phoneNumber': phoneNumber
    };
  }

  copyWith({
    String? imageUrl,
    String? uid,
  }) {
    return TraineeModel(
      name: name,
      email: email,
      age: age,
      imageUrl: imageUrl ?? this.imageUrl,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber,
    );
  }
}
