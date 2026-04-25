import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/activity_button.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/activity_grid_view.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class MoneyDonationCard extends StatefulWidget {
  const MoneyDonationCard({super.key, this.isSeeAllButtonAvailable = false});
  final bool isSeeAllButtonAvailable;

  @override
  State<MoneyDonationCard> createState() => _MoneyDonationCardState();
}

class _MoneyDonationCardState extends State<MoneyDonationCard> {
  late bool isActivityVisible;
  @override
  void initState() {
    super.initState();
    isActivityVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            children: [
              Text(
                locale.moneyDonation,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              if (widget.isSeeAllButtonAvailable == true)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActivityVisible = !isActivityVisible;
                    });
                  },
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        locale.myActivity,
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                      if (isActivityVisible)
                        Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.mainColor,
                            size: 20,
                          ),
                        )
                      else
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.mainColor,
                          size: 20,
                        ),
                    ],
                  ),
                ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1,
                  child: child,
                ),
              );
            },
            child: isActivityVisible
                ? ActivityGridView(
                    itemCount: 1,
                    buttons: [
                      ActivityButton(
                        color: AppColors.mainColor,
                        icon: Icon(
                          Icons.schedule_rounded,
                          color: AppColors.mainColor,
                        ),
                        title: locale.transactionHistory,
                      ),
                    ],
                  )
                : const SizedBox(key: ValueKey(false)),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
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
                            AppLocalizations.of(context)!.everyDonationCanSave,
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
                            AppLocalizations.of(context)!.saveWithDonation,
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
                            AppLocalizations.of(context)!.donateNow,
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
              PositionedDirectional(
                end: 0,
                bottom: 0,
                child: Assets.home.common.moneyDonation.svg(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
