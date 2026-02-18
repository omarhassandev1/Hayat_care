import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class ProfileTabHeader extends StatelessWidget {
  const ProfileTabHeader({super.key, required this.isDark});

  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [Color(0xFF1E3A8A), Color(0xFF0F172A)]
              : [Colors.blueAccent, Colors.blue[50]!],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGreyColor,
            radius: 50.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: CachedNetworkImage(
                imageUrl:'https://instagram.fcai19-8.fna.fbcdn.net/v/t51.2885-19/628267385_18394191415178409_3764287358818384500_n.jpg?stp=dst-jpg_s320x320_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fcai19-8.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QGSaOecX26YZpTCmVMVU1-Y0auag-kkP6YV8Wvqes4Qr6AfhdJD20Pf2JJyQemkeJ0&_nc_ohc=7sFEQzgPqTAQ7kNvwEVGo4X&_nc_gid=9NUHZRAFwuVg_8KC7_Fh0A&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfumVa8eg_W-8qfIqt8EH44djw97Op2_2Eit91_qc1tvOQ&oe=69979FEF&_nc_sid=8b3546',
                errorWidget: (context, url, error) => Assets.profile.personErrorView.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 60.h,
                    width: 60.h
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Omar Hassan',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'omarhassandev1@gmail.com',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[isDark?300: 700],
            ),
          ),
        ],
      ),
    );
  }
}
