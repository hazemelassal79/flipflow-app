import 'dart:io';

class TraineeEntity {
  final String name;
  final String email;
  final String imageUrl;
  final String uid;
  final String phoneNumber;
  final int age;
  final File? image;
  TraineeEntity({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.uid,
    required this.phoneNumber,
    required this.age,
    this.image,
  });
}
