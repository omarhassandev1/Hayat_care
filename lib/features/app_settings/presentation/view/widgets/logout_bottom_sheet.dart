import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/gen/assets.gen.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_main_button.dart';
import '../../../../../core/widgets/custom_secondary_button.dart';
import '../../../../../localization/app_localizations.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
              child: Assets.profile.logoutBottomSheet.svg(height: 40.h),
            ),
            SizedBox(height: 20.h),
            Text(
              AppLocalizations.of(context)!.logOutOfYourAccount,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 32.h),
            Row(
              spacing: 32.w,
              children: [
                CustomSecondaryButton(
                  label: AppLocalizations.of(context)!.cancel,
                  borderColor: isDark? AppColors.greyColor : AppColors.lightGreyColor,
                  textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isDark? AppColors.lightGreyColor : AppColors.darkGreyColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                CustomMainButton(
                  label: AppLocalizations.of(context)!.confirm_button,
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
