import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../core/enums/doctor_specialty_enum.dart';
import '../../../../../gen/assets.gen.dart';

import '../../../../doctor_browsing/presentation/view/screens/doctors_search_screen.dart';
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
      SpecialtyItem(specialty: DoctorSpecialtyEnum.general,      icon: Assets.home.doctorSpecialtyIcons.general.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.dentist,      icon: Assets.home.doctorSpecialtyIcons.dentist.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.orthopedics,        icon: Assets.home.doctorSpecialtyIcons.ophda.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.nutrition,    icon: Assets.home.doctorSpecialtyIcons.nutrition.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.neurology,        icon: Assets.home.doctorSpecialtyIcons.neuro.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.heart,        icon: Assets.home.doctorSpecialtyIcons.heart.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.bones,        icon: Assets.home.doctorSpecialtyIcons.bones.svg(height: 24.h)),
      SpecialtyItem(specialty: DoctorSpecialtyEnum.addiction,    icon: Assets.home.doctorSpecialtyIcons.addiction.svg(height: 24.h)),
    ];
  }}

// SpecialtyItem now takes DoctorSpecialtyEnum instead of String label

class SpecialtyItem extends StatelessWidget {
  const SpecialtyItem({
    super.key,
    required this.specialty,
    required this.icon,
  });

  final DoctorSpecialtyEnum specialty;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DoctorsSearchScreen(initialSpecialty: specialty),
          ),
        );
      },
      child: Column(
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
              specialty.toLocalizedString(context),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}