import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/notifications/domain/entities/notification_entity.dart';
import 'package:hayat_care/features/notifications/domain/entities/notification_type_enums.dart';

class NotificationItem extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationItem({super.key, required this.notification});

  _NotificationStyle get _style {
    switch (notification.type) {
      case NotificationType.success:
        return _NotificationStyle(
          icon: Icons.check_circle_outline_outlined,
          bgColor: const Color(0xFFE8F5E9),
          iconColor: const Color(0xFF2E7D32),
        );
      case NotificationType.cancelled:
        return _NotificationStyle(
          icon: Icons.cancel_outlined,
          bgColor: const Color(0xFFFFEBEE),
          iconColor: const Color(0xFFC62828),
        );
      case NotificationType.scheduleChanged:
        return _NotificationStyle(
          icon: Icons.schedule_rounded,
          bgColor: const Color(0xFFFFF3E0),
          iconColor: const Color(0xFFE65100),
        );
      case NotificationType.newService:
        return _NotificationStyle(
          icon: Icons.star_rounded,
          bgColor: const Color(0xFFE3F2FD),
          iconColor: const Color(0xFF1565C0),
        );
      case NotificationType.payment:
        return _NotificationStyle(
          icon: Icons.payment_rounded,
          bgColor: const Color(0xFFF3E5F5),
          iconColor: const Color(0xFF6A1B9A),
        );
    }
  }

  String _formatTime() {
    final now = DateTime.now();
    final diff = now.difference(notification.time);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }


  @override
  Widget build(BuildContext context) {
    final style = _style;
    final textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right:20.w, bottom: 30.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: style.iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  style.icon,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),

              SizedBox(width: 14.w),

              // 🔵 CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4.h),
                    Text(
                      _formatTime(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            notification.description,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 13.sp,
              color: isDark
                  ? AppColors.lightGreyColor
                  : AppColors.darkGreyColor,
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _NotificationStyle {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const _NotificationStyle({
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });
}
