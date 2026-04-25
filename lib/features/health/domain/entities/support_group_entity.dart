import 'package:hayat_care/core/enums/support_group_type_enum.dart';

class SupportGroupEntity {
  final String id;
  final String name;
  final String description;
  final String schedule;
  final SupportGroupTypeEnum type;

  const SupportGroupEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.schedule,
    required this.type,
  });
}