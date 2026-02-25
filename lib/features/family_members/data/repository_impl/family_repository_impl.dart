import 'package:injectable/injectable.dart';

import '../../../family_members/domain/entities/family_member_entity.dart';
import '../../../family_members/domain/repository/family_repository.dart';
import '../data_source/mock_family_datasource.dart';

@LazySingleton(as: FamilyRepository)
class FamilyRepositoryImpl implements FamilyRepository {
  final MockFamilyDataSource dataSource;

  FamilyRepositoryImpl(this.dataSource);

  @override
  Future<List<FamilyMemberEntity>> getFamilyMembers() {
    return dataSource.getMembers();
  }

  @override
  Future<void> addFamilyMember(FamilyMemberEntity member) {
    return dataSource.addMember(member);
  }

  @override
  Future<void> deleteFamilyMember(String nationalId) {
    return dataSource.deleteMember(nationalId);
  }
}