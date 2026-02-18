import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/Onboarding/presentation/widgets/header_widget.dart';
import '../../../../localization/app_localizations.dart';
import '../../data/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  final int index;

  const OnBoardingItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingHeaderWidget(header: model.header, index: index),
        SizedBox(height: 40.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Image.asset(model.image, height: 250.h),
        ),
        SizedBox(height: 32.h),
        Text(
          getTitle(context),
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.mainColor),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            getDescription(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  String getTitle(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    switch (index) {
      case 0:
        return loc.onboarding_title_1;
      case 1:
        return loc.onboarding_title_2;
      case 2:
        return loc.onboarding_title_3;
      case 3:
        return loc.onboarding_title_4;
      default:
        return "";
    }
  }

  String getDescription(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    switch (index) {
      case 0:
        return loc.onboarding_desc_1;
      case 1:
        return loc.onboarding_desc_2;
      case 2:
        return loc.onboarding_desc_3;
      case 3:
        return loc.onboarding_desc_4;
      default:
        return "";
    }
  }


}
