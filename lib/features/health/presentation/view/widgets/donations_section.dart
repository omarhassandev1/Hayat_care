import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';

class DonationsSection extends StatelessWidget {
  const DonationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = AppLocalizations.of(context)!.localeName == "ar";
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20.0.w, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.donations,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        DonationCard(
          illustration: isArabic
              ? Transform.flip(
                  flipX: true,
                  child: Assets.home.common.bloodDoantion.svg(),
                )
              : Assets.home.common.bloodDoantion.svg(),
          title: AppLocalizations.of(context)!.everyDropBlood,
          subtitle: AppLocalizations.of(context)!.saveWithBloodDonation,
          buttonText: AppLocalizations.of(context)!.donateNow,
          color: AppColors.bloodyRedColor,
        ),
        DonationCard(
          illustration: Assets.home.common.moneyDonation.svg(),
          title: AppLocalizations.of(context)!.everyDonationCanSave,
          subtitle: AppLocalizations.of(context)!.saveWithDonation,
          buttonText: AppLocalizations.of(context)!.donateNow,
          color: AppColors.mainColor,
        ),
      ],
    );
  }
}

class DonationCard extends StatelessWidget {
  const DonationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.color,
    required this.illustration,
  });
  final String title;
  final String subtitle;
  final String buttonText;
  final Color color;
  final Widget illustration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
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
                        title,
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
                        subtitle,
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
                        foregroundColor: color,
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          PositionedDirectional(end: 0.w, bottom: 0.h, child: illustration),
        ],
      ),
    );
  }
}
