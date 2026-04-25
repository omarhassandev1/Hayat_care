import 'package:hayat_care/features/health/domain/repositories/health_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/data/datasources/health_mock_datasource.dart';
import 'package:hayat_care/features/health/domain/entities/donation_entity.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/domain/entities/support_group_entity.dart';

@LazySingleton(as: HealthRepository)
class HealthRepositoryImpl implements HealthRepository {
  final HealthMockDatasource _datasource;
  HealthRepositoryImpl(this._datasource);

  @override
  Future<List<SupportGroupEntity>> getSupportGroups() =>
      _datasource.getSupportGroups();

  @override
  Future<void> joinSupportGroup(GroupSessionRequestEntity request) =>
      _datasource.joinSupportGroup(request);

  @override
  Future<void> submitDonation(DonationEntity donation) =>
      _datasource.submitDonation(donation);
}