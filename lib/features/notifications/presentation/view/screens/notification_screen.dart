import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../cubit/notification_cubit.dart';
import '../../cubit/notification_state.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const String routeName = 'notificationsScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NotificationCubit>()..fetchNotifications(),
      child: const _NotificationView(),
    );
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading || state is NotificationInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 48.r,
                      color: Colors.red.shade300,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Something went wrong.\nPlease try again.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 16.h),
                    TextButton(
                      onPressed: () => context
                          .read<NotificationCubit>()
                          .fetchNotifications(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is NotificationSuccess) {
            if (state.grouped.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications_off_outlined,
                      size: 56.r,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'No notifications yet',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView(
              padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
              children: [
                for (final entry in state.grouped.entries) ...[
                  // ── Date group header
                  _DateGroupHeader(label: entry.key),

                  // ── Notifications in this group
                  for (final notification in entry.value)
                    NotificationItem(notification: notification),

                  Divider(indent: 20.w,endIndent: 20.w,height: 0,),

                  SizedBox(height: 8.h),
                ],
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// ── Date group header ─────────────────────────────────────────────────────────

class _DateGroupHeader extends StatelessWidget {
  final String label;

  const _DateGroupHeader({required this.label});

  @override
  Widget build(BuildContext context) {
            bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13.sp,
          color: isDark ? AppColors.lightGreyColor : AppColors.darkGreyColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
