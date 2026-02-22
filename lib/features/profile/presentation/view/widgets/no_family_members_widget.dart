import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/profile/presentation/view/screens/add_family_member_screen.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_main_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/app_localizations.dart';

class NoFamilyMembersWidget extends StatelessWidget {
  const NoFamilyMembersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.profile.noFamilyYet.svg(),
            SizedBox(height: 40.h),
            Text(
              AppLocalizations.of(context)!.noFamilyDataYet,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 24.sp,
                color: AppColors.mainColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              AppLocalizations.of(context)!.addFamilyDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                CustomMainButton(
                  label: AppLocalizations.of(context)!.addFamilyMember,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddFamilyMemberScreen(),));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
