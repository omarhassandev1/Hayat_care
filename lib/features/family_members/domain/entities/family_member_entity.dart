import 'package:hayat_care/core/enums/gender_enum.dart';

class FamilyMemberEntity {
  final String nationalId;
  final String name;
  final String relationship;
  final DateTime birthDate;
  final String? imageUrl;
  final Gender gender;

  FamilyMemberEntity({
    required this.nationalId,
    required this.name,
    required this.relationship,
    required this.birthDate,
    required this.gender,
    this.imageUrl,
  });
}