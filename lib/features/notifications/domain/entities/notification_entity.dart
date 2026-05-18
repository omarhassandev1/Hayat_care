import 'notification_type_enums.dart';

class NotificationEntity {
  final String id;
  final String title;
  final String description;
  final DateTime time;
  final NotificationType type;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
  });
}