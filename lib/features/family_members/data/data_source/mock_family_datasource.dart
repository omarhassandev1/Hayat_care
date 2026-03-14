import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:injectable/injectable.dart';

import '../../../family_members/domain/entities/family_member_entity.dart';

@lazySingleton
class MockFamilyDataSource {
  final List<FamilyMemberEntity> _members = [
    FamilyMemberEntity(
      nationalId: '29803151234567',
      name: 'Ahmed Ali',
      relationship: 'Father',
      birthDate: DateTime(1964, 10, 25),
      gender: Gender.male,
    ),
    FamilyMemberEntity(
      nationalId: '30104221234567',
      name: 'Mona Mohammed',
      relationship: 'Mother',
      birthDate: DateTime(1968, 4, 12),
      gender: Gender.female,
    ),
    FamilyMemberEntity(
      nationalId: '30209181234567',
      name: 'Youssef Ali',
      relationship: 'Brother',
      birthDate: DateTime(1998, 9, 18),
      gender: Gender.male,
    ),
    FamilyMemberEntity(
      nationalId: '30506151234567',
      name: 'Salma Ali',
      relationship: 'Sister',
      birthDate: DateTime(2002, 6, 15),
      gender: Gender.female,
    ),
  ];

  Future<List<FamilyMemberEntity>> getMembers() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return List.from(_members);
  }

  Future<void> addMember(FamilyMemberEntity member) async {
    _members.add(member);
  }

  Future<void> deleteMember(String nationalId) async {
    _members.removeWhere((e) => e.nationalId == nationalId);
  }
}
