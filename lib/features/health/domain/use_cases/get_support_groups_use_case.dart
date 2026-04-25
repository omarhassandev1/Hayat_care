import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/support_group_entity.dart';
import 'package:hayat_care/features/health/domain/repositories/health_repository.dart';

@injectable
class GetSupportGroupsUseCase {
  final HealthRepository _repository;
  GetSupportGroupsUseCase(this._repository);

  Future<List<SupportGroupEntity>> call() => _repository.getSupportGroups();
}