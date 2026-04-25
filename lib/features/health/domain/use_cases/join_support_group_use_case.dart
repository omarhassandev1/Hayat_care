import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/domain/repositories/health_repository.dart';

@injectable
class JoinSupportGroupUseCase {
  final HealthRepository _repository;
  JoinSupportGroupUseCase(this._repository);

  Future<void> call(GroupSessionRequestEntity request) =>
      _repository.joinSupportGroup(request);
}