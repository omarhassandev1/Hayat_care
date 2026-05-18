import '../../domain/entities/notification_entity.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final Map<String, List<NotificationEntity>> grouped;

  NotificationSuccess({required this.grouped});
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError({required this.message});
}