import 'package:hayat_care/core/enums/support_group_type_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/donation_entity.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/domain/entities/support_group_entity.dart';

@lazySingleton
class HealthMockDatasource {
  Future<List<SupportGroupEntity>> getSupportGroups() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      SupportGroupEntity(
        id: '1',
        name: 'Addiction Support Group',
        description: 'A safe space to share and heal together.',
        schedule: 'Every Monday 6:00 PM',
        type: SupportGroupTypeEnum.addictionSupport,
      ),
      SupportGroupEntity(
        id: '2',
        name: 'Mental Health Circle',
        description: 'Weekly sessions for mental wellness.',
        schedule: 'Every Wednesday 5:00 PM',
        type: SupportGroupTypeEnum.mentalHealth,
      ),
      SupportGroupEntity(
        id: '3',
        name: 'Chronic Illness Support',
        description: 'Support for those managing chronic conditions.',
        schedule: 'Every Friday 4:00 PM',
        type: SupportGroupTypeEnum.chronicIllness,
      ),
    ];
  }

  Future<void> joinSupportGroup(GroupSessionRequestEntity request) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Will be replaced with real API call
  }

  Future<void> submitDonation(DonationEntity donation) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Will be replaced with real API call
  }
}