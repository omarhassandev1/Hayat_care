import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/use_cases/get_notifications_use_case.dart';
import 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;

  NotificationCubit(this._getNotificationsUseCase)
      : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await _getNotificationsUseCase();
      final grouped = _groupByDate(notifications);
      emit(NotificationSuccess(grouped: grouped));
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }

  /// Groups a flat list into a LinkedHashMap keyed by human-readable date labels.
  /// Order is preserved: Today → Yesterday → older dates (most recent first).
  Map<String, List<NotificationEntity>> _groupByDate(
      List<NotificationEntity> notifications,
      ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final Map<String, List<NotificationEntity>> grouped = {};

    for (final n in notifications) {
      final date = DateTime(n.time.year, n.time.month, n.time.day);
      final String label;

      if (date == today) {
        label = 'Today';
      } else if (date == yesterday) {
        label = 'Yesterday';
      } else {
        // e.g. "Mon, 21 Apr"
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        const months = [
          'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        ];
        label =
        '${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
      }

      grouped.putIfAbsent(label, () => []).add(n);
    }

    return grouped;
  }
}