import 'package:hayat_care/features/notifications/domain/entities/notification_entity.dart';
import 'package:hayat_care/features/notifications/domain/entities/notification_type_enums.dart';
import 'package:injectable/injectable.dart';

abstract class ILocalNotificationDatasource {
  Future<List<NotificationEntity>> getNotifications();
}

@LazySingleton(as: ILocalNotificationDatasource)
class LocalNotificationDatasource implements ILocalNotificationDatasource {
  @override
  Future<List<NotificationEntity>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final now = DateTime.now();

    return [
      NotificationEntity(
        id: '1',
        title: 'Appointment Confirmed',
        description:
        'Your appointment with Dr. Ahmed Hassan on Monday, 28 Apr at 10:00 AM has been successfully booked.',
        time: now.subtract(const Duration(minutes: 15)),
        type: NotificationType.success,
      ),
      NotificationEntity(
        id: '2',
        title: 'Appointment Cancelled',
        description:
        'Your appointment scheduled for Tuesday, 29 Apr at 2:00 PM has been cancelled. Tap to rebook.',
        time: now.subtract(const Duration(hours: 2)),
        type: NotificationType.cancelled,
      ),
      NotificationEntity(
        id: '3',
        title: 'Schedule Change',
        description:
        'Dr. Sara Ali has rescheduled your appointment from Wednesday to Thursday, 1 May at 11:00 AM.',
        time: now.subtract(const Duration(hours: 5)),
        type: NotificationType.scheduleChanged,
      ),
      NotificationEntity(
        id: '4',
        title: 'Payment Successful',
        description:
        'A payment of 350 EGP for your appointment with Dr. Khaled Nour has been processed successfully.',
        time: now.subtract(const Duration(days: 1, hours: 1)),
        type: NotificationType.payment,
      ),
      NotificationEntity(
        id: '5',
        title: 'New Service Available',
        description:
        'Hayat Care now offers home visit consultations. Book a doctor from the comfort of your home.',
        time: now.subtract(const Duration(days: 1, hours: 6)),
        type: NotificationType.newService,
      ),
      NotificationEntity(
        id: '6',
        title: 'Appointment Confirmed',
        description:
        'Your appointment with Dr. Mona Samir on Friday, 25 Apr at 9:00 AM was confirmed.',
        time: now.subtract(const Duration(days: 2)),
        type: NotificationType.success,
      ),
      NotificationEntity(
        id: '7',
        title: 'Payment Pending',
        description:
        'Your payment of 200 EGP for the upcoming appointment is still pending. Please complete it before your visit.',
        time: now.subtract(const Duration(days: 2, hours: 3)),
        type: NotificationType.payment,
      ),
      NotificationEntity(
        id: '8',
        title: 'New Service Available',
        description:
        'Mental health consultations are now available. Browse qualified psychiatrists and psychologists in the app.',
        time: now.subtract(const Duration(days: 3)),
        type: NotificationType.newService,
      ),
    ];
  }
}