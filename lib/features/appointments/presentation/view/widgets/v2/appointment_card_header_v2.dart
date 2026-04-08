import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/doctor_browsing/presentation/view/screens/doctor_profile_screen.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class AppointmentCardHeaderV2 extends StatelessWidget {
  final DoctorEntity doctor;
  final DateTime dateTime;
  final String statusLabel;
  final Color statusColor;
  final bool? isCancelled;

  const AppointmentCardHeaderV2({
    super.key,
    required this.doctor,
    required this.dateTime,
    required this.statusLabel,
    required this.statusColor,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DoctorProfileScreen(doctor: doctor),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.r),
                bottomStart: isCancelled == true
                    ? Radius.circular(16.r)
                    : Radius.zero,
              ),
              child: CachedNetworkImage(
                imageUrl: doctor.imageUrl,
                width: 120.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  width: 90.w,
                  height: 90.h,
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
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DoctorProfileScreen(doctor: doctor),
                            ),
                          ),
                          child: Text(
                            doctor.name,
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(fontFamily: 'poppins'),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _StatusBadge(label: statusLabel, color: statusColor),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 8.h),
                  // Specialty
                  _InfoRow(
                    icon: doctor.specialty.specialtyIcon,
                    text: doctor.specialty.toLocalizedString(context),
                  ),
                  SizedBox(height: 6.h),
                  // Date
                  _InfoRow(
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      size: 14.sp,
                      color: AppColors.mainColor,
                    ),
                    text: DateFormat('MMMM d, y').format(dateTime),
                  ),
                  SizedBox(height: 6.h),
                  // Time
                  _InfoRow(
                    icon: Icon(
                      Icons.access_time_outlined,
                      size: 14.sp,
                      color: AppColors.mainColor,
                    ),
                    text: DateFormat('hh:mm a').format(dateTime),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final Widget icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
