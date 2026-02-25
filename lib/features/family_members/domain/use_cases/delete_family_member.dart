import 'package:injectable/injectable.dart';
import '../repository/family_repository.dart';

@lazySingleton
class DeleteFamilyMemberUseCase {
  final FamilyRepository repository;

  DeleteFamilyMemberUseCase({required this.repository});

  Future<void> call(String nationalId) =>
      repository.deleteFamilyMember(nationalId);
}
