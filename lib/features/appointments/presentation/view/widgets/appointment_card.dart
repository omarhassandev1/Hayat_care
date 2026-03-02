import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:intl/intl.dart';
import '../../../../../gen/assets.gen.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const AppointmentCard({super.key, required this.appointmentWithDoctor});

  @override
  Widget build(BuildContext context) {
    final appointment = appointmentWithDoctor.appointment;
    final doctor = appointmentWithDoctor.doctor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: doctor.imageUrl,
                    width: 110.w,
                    height: 110.h,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
                      width: 80.w,
                      height: 80.h,
                      color: AppColors.lightGreyColor,
                      child: Assets.profile.personErrorView.svg(
                        colorFilter: ColorFilter.mode(
                          AppColors.mainColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Messaging  -  ',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          _StatusBadge(status: appointment.status),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        DateFormat(
                          'MMMM d, y  |  hh:mm a',
                        ).format(appointment.dateTime),
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (appointment.status != AppointmentStatusEnum.cancelled) ...[
              SizedBox(height: 12.h),
              Divider(
                thickness: 0.5,
                color: isDark
                    ? AppColors.lightGreyColor
                    : AppColors.darkGreyColor,
              ),
              SizedBox(height: 12.h),
              _AppointmentButtons(status: appointment.status),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final AppointmentStatusEnum status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      AppointmentStatusEnum.upcoming => AppColors.mainColor,
      AppointmentStatusEnum.completed => AppColors.greenColor,
      AppointmentStatusEnum.cancelled => Colors.red,
    };

    final label = switch (status) {
      AppointmentStatusEnum.upcoming => 'Upcoming',
      AppointmentStatusEnum.completed => 'Completed',
      AppointmentStatusEnum.cancelled => 'Cancelled',
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _AppointmentButtons extends StatelessWidget {
  final AppointmentStatusEnum status;

  const _AppointmentButtons({required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: status == AppointmentStatusEnum.upcoming
                      ? Colors.red
                      : AppColors.mainColor,
                ),
              ),
              child: Text(
                status == AppointmentStatusEnum.upcoming
                    ? 'Cancel Appointment'
                    : 'Book Again',
                style: TextStyle(
                  color: status == AppointmentStatusEnum.upcoming
                      ? Colors.red
                      : AppColors.mainColor,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              status == AppointmentStatusEnum.upcoming
                  ? 'Reschedule'
                  : 'Leave a review',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
