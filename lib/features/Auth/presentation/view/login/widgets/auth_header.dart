import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.brief});
  final String title;
  final String brief;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: SizedBox(
        width: 276.w,
        child: Column(
          spacing: 10,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22.sp,color: AppColors.mainColor),textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(brief, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
