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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      backgroundColor: Color(0xffFFFAFA),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.common.svg.dialogValidIcon.svg(),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D74FF),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 44.h,
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
              const SizedBox(height: 12),
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
    );
  }

}