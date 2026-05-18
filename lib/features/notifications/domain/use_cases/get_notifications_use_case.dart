import 'package:injectable/injectable.dart';
import '../entities/notification_entity.dart';
import '../repositories/i_notification_repository.dart';

@injectable
class GetNotificationsUseCase {
  final INotificationRepository _repository;

  GetNotificationsUseCase(this._repository);

  Future<List<NotificationEntity>> call() {
    return _repository.getNotifications();
  }
}