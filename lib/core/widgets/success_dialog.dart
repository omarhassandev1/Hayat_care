import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

import '../../gen/assets.gen.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      child: Container(
        decoration: BoxDecoration(
          color:  Theme.of(context).scaffoldBackgroundColor,
          borderRadius:  BorderRadius.circular(40.r),
          border: Border.all(
            color: AppColors.mainColor,
            width: Theme.of(context).brightness == Brightness.dark? 1.5 : 0
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.common.svg.dialogValidIcon.svg(),
              SizedBox(height: 24.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              SizedBox(height: 16.h),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: onPrimaryPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D74FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                  ),
                  child: Text(
                    primaryButtonText,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),

              if (secondaryButtonText != null) ...[
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: onSecondaryPressed,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.redColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text(
                      secondaryButtonText!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.redColor),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

}