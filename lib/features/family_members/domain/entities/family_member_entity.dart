class FamilyMemberEntity {
  final String nationalId;
  final String name;
  final String relationship;
  final DateTime birthDate;
  final String? imageUrl;

  FamilyMemberEntity({
    required this.nationalId,
    required this.name,
    required this.relationship,
    required this.birthDate,
    this.imageUrl,
  });
}