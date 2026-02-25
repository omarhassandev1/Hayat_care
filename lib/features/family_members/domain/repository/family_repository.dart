import '../entities/family_member_entity.dart';

abstract class FamilyRepository {
  Future<List<FamilyMemberEntity>> getFamilyMembers();
  Future<void> addFamilyMember(FamilyMemberEntity member);
  Future<void> deleteFamilyMember(String nationalId);
}