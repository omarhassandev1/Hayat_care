import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/blood_donation_card.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/money_donation_card.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class DonationsSection extends StatelessWidget {
  const DonationsSection({super.key, this.isSeeAllButtonAvailable = false});
  final bool isSeeAllButtonAvailable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0.w, bottom: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.donations,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.mainColor,fontSize: 24.sp),
              ),
            ],
          ),
        ),
        BloodDonationCard(isSeeAllButtonAvailable: isSeeAllButtonAvailable),
        MoneyDonationCard(isSeeAllButtonAvailable: isSeeAllButtonAvailable),
      ],
    );
  }
}
