import 'package:hayat_care/features/family_members/domain/entities/family_member_entity.dart';
import 'package:hayat_care/features/family_members/domain/repository/family_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFamilyMemberUseCase {
  final FamilyRepository repository;

  AddFamilyMemberUseCase({required this.repository});

  Future<void> call(FamilyMemberEntity member) =>
      repository.addFamilyMember(member);
}
