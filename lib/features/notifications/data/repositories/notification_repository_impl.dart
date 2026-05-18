import 'package:injectable/injectable.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/i_notification_repository.dart';
import '../datasources/local_notification_datasource.dart';

@LazySingleton(as: INotificationRepository)
class NotificationRepositoryImpl implements INotificationRepository {
  final ILocalNotificationDatasource _datasource;

  NotificationRepositoryImpl(this._datasource);

  @override
  Future<List<NotificationEntity>> getNotifications() {
    return _datasource.getNotifications();
  }
}