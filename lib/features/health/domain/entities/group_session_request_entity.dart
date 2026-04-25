import 'package:hayat_care/core/enums/support_group_type_enum.dart';

class GroupSessionRequestEntity {
  final String fullName;
  final String ageRange;
  final String gender;
  final String phoneNumber;
  final String address;
  final SupportGroupTypeEnum groupType;

  const GroupSessionRequestEntity({
    required this.fullName,
    required this.ageRange,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.groupType,
  });
}