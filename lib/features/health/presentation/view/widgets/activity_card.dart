import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var locale = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24.h, right: 8.w, left: 8.w),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF121212) : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.mainColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: isDark ? AppColors.mainColor : const Color(0x162B7FFF),
                  blurRadius: isDark ? 55 : 65,
                  spreadRadius: isDark ? -16 : 6,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            spacing: 2.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.myActivity,
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                locale.trackYourImpact,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Assets.health.statsIcon.svg(),
                    ],
                  ),
                ),

                SizedBox(height: 14.h),

                /// Stats Container
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 4.w),
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0x9B282828)
                        : const Color(0xFFF7F7F7),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    border: Border.all(color: isDark? AppColors.darkGreyColor.withValues(alpha: .3) : AppColors.lightGreyColor, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _statItem(
                          context,
                          title: locale.bloodDonations,
                          value: "3",
                          color: const Color(0x19FB2C36),
                          icon: Assets.health.bloodIcon.svg(),
                        ),
                      ),
                      Expanded(
                        child: _statItem(
                          context,
                          title: locale.contributions,
                          value: "5",
                          color: const Color(0x192B7FFF),
                          icon: Assets.health.contributionsIcon.svg(),
                        ),
                      ),
                      Expanded(
                        child: _statItem(
                          context,
                          title: locale.sessionsAttended,
                          value: "2",
                          color: const Color(0x1900C950),
                          icon: Assets.health.groupIcon.svg(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.mainColor, width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(
    BuildContext context, {
    required String title,
    required String value,
    required Color color,
    required Widget icon,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: icon,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
