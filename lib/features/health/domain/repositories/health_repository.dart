import 'package:hayat_care/features/health/domain/entities/donation_entity.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/domain/entities/support_group_entity.dart';

abstract class HealthRepository {
  Future<List<SupportGroupEntity>> getSupportGroups();
  Future<void> joinSupportGroup(GroupSessionRequestEntity request);
  Future<void> submitDonation(DonationEntity donation);
}