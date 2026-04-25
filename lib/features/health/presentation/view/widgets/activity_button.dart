import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

class ActivityButton extends StatelessWidget {
  const ActivityButton({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
  });

  final Color color;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 45.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkGreyColor.withValues(alpha: .5)
              : AppColors.greyColor.withValues(alpha: .5),
        ),
      ),
      child: Row(
        spacing: 5.w,
        children: [
          icon,
          Text(title, style: TextStyle(color: color)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: color),
        ],
      ),
    );
  }
}
