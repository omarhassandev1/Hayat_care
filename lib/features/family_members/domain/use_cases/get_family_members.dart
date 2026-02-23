import 'package:injectable/injectable.dart';
import '../entities/family_member_entity.dart';
import '../repository/family_repository.dart';

@lazySingleton
class GetFamilyMembersUseCase {
  final FamilyRepository repository;

  GetFamilyMembersUseCase({required this.repository});

  Future<List<FamilyMemberEntity>> call() => repository.getFamilyMembers();
}
