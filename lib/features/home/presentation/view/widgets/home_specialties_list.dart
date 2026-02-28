import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';
import 'package:auto_size_text/auto_size_text.dart';
class HomeSpecialtiesList extends StatelessWidget {
  const HomeSpecialtiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.doctorSpecialty,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.seeAll,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.mainColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 220.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 20.w,
              childAspectRatio: 60/90
            ),
            itemCount: 8,
            itemBuilder: (ctx, index) => _buildSpecialtyItem(context)[index],
          ),
        ),
      ],
    );
  }

  List<SpecialtyItem> _buildSpecialtyItem(BuildContext context) {
    return [
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_general,
        icon: Assets.home.doctorSpecialtyIcons.general.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_dentist,
        icon: Assets.home.doctorSpecialtyIcons.dentist.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_ophda,
        icon: Assets.home.doctorSpecialtyIcons.ophda.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_nutrition,
        icon: Assets.home.doctorSpecialtyIcons.nutrition.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_neuro,
        icon: Assets.home.doctorSpecialtyIcons.neuro.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_heart,
        icon: Assets.home.doctorSpecialtyIcons.heart.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_bones,
        icon: Assets.home.doctorSpecialtyIcons.bones.svg(height: 24.h),
      ),
      SpecialtyItem(
        label: AppLocalizations.of(context)!.specialty_addiction,
        icon: Assets.home.doctorSpecialtyIcons.addiction.svg(height: 24.h),
      ),
    ];
  }
}

class SpecialtyItem extends StatelessWidget {
  const SpecialtyItem({super.key, required this.label, required this.icon});
  final String label;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30.h,
          backgroundColor: Colors.blue.withValues(alpha: 0.1),
          child: icon,
        ),
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            label,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
