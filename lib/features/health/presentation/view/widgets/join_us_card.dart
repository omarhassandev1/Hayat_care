import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';

class JoinUsCard extends StatelessWidget {
  const JoinUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 3.h, top: 34.h, bottom: 24.h),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Column(
                    spacing: 12.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          AppLocalizations.of(context)!.oneBraveStep,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          AppLocalizations.of(context)!.saveLifeByReaching,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.mainColor,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.joinUs,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          PositionedDirectional(
            end: 0.w,
            bottom: 0.h,
            child: Assets.home.common.joinUs.svg()),
        ],
      ),
    );
  }
}
