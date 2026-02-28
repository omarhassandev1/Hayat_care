import 'package:hayat_care/core/enums/gender_enum.dart';

class UserEntity {
  final String name;
  final String nationalId;
  final String email;
  final String phoneNumber;
  final Gender gender;
  final DateTime dateOfBirth;
  final String? emergencyNumber;
  final String? imageUrl;

  const UserEntity({
    required this.name,
    required this.nationalId,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    this.emergencyNumber,
    required this.imageUrl,
  });
}