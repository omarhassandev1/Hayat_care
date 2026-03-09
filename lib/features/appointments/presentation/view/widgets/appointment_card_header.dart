import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/doctor_browsing/presentation/view/screens/doctor_profile_screen.dart';
import 'package:intl/intl.dart';
import '../../../../../gen/assets.gen.dart';

class AppointmentCardHeader extends StatelessWidget {
  final DoctorEntity doctor;
  final DateTime dateTime;
  final String statusLabel;
  final Color statusColor;

  const AppointmentCardHeader({
    super.key,
    required this.doctor,
    required this.dateTime,
    required this.statusLabel,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DoctorProfileScreen(doctor: doctor),
                ),
              );
            },
            child: CachedNetworkImage(
              imageUrl: doctor.imageUrl,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                width: 110.w,
                height: 110.h,
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
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DoctorProfileScreen(doctor: doctor),
                    ),
                  );
                },
                child: Text(
                  doctor.name,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    'Messaging  -  ',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                  ),
                  _StatusBadge(label: statusLabel, color: statusColor),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                DateFormat('MMMM d, y  |  hh:mm a').format(dateTime),
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
            ],
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
          fontSize: 12.sp,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
