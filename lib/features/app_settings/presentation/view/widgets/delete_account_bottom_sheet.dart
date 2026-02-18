import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_main_button.dart';
import '../../../../../core/widgets/custom_secondary_button.dart';
import '../../../../../localization/app_localizations.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              padding: EdgeInsetsGeometry.all(15.r),
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.delete,
                size: 40.h,
                color: Colors.white,
                // color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppLocalizations.of(
                context,
              )!.confirmAccountDeletion,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 32.h),
            Row(
              spacing: 32.w,
              children: [
                CustomSecondaryButton(
                  label: AppLocalizations.of(context)!.cancel,
                ),
                CustomMainButton(
                  label: AppLocalizations.of(
                    context,
                  )!.confirm_button,
                  fillColor: AppColors.redColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
