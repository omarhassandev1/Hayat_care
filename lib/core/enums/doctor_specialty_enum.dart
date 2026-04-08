import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

enum DoctorSpecialtyEnum {
  general,
  dentist,
  nutrition,
  heart,
  bones,
  addiction,
  cardiologists,
  ophthalmology,
  neurology,
}

extension DoctorSpecialtyEnumX on DoctorSpecialtyEnum {
  String toLocalizedString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    switch (this) {
      case DoctorSpecialtyEnum.general:
        return l.specialty_general;
      case DoctorSpecialtyEnum.dentist:
        return l.specialty_dentist;
      case DoctorSpecialtyEnum.nutrition:
        return l.specialty_nutrition;
      case DoctorSpecialtyEnum.heart:
        return l.specialty_heart;
      case DoctorSpecialtyEnum.bones:
        return l.specialty_bones;
      case DoctorSpecialtyEnum.addiction:
        return l.specialty_addiction;
      case DoctorSpecialtyEnum.cardiologists:
        return l.cardiologists;
      case DoctorSpecialtyEnum.ophthalmology:
        return l.ophthalmology;
      case DoctorSpecialtyEnum.neurology:
        return l.neurology;
    }
  }

  Widget get specialtyIcon {
    switch (this) {
      case DoctorSpecialtyEnum.general:
        return Assets.home.doctorSpecialtyIcons.general.svg(height: 14.sp);
      case DoctorSpecialtyEnum.dentist:
        return Assets.home.doctorSpecialtyIcons.dentist.svg(height: 14.sp);
      case DoctorSpecialtyEnum.nutrition:
        return Assets.home.doctorSpecialtyIcons.nutrition.svg(height: 14.sp);
      case DoctorSpecialtyEnum.heart:
        return Assets.home.doctorSpecialtyIcons.heart.svg(height: 14.sp);
      case DoctorSpecialtyEnum.bones:
        return Assets.home.doctorSpecialtyIcons.bones.svg(height: 14.sp);
      case DoctorSpecialtyEnum.addiction:
        return Assets.home.doctorSpecialtyIcons.addiction.svg(height: 14.sp);
      case DoctorSpecialtyEnum.cardiologists:
        return Assets.home.doctorSpecialtyIcons.heart.svg(height: 14.sp);
      case DoctorSpecialtyEnum.ophthalmology:
        return Assets.home.doctorSpecialtyIcons.ophda.svg(height: 14.sp);
      case DoctorSpecialtyEnum.neurology:
        return Assets.home.doctorSpecialtyIcons.neuro.svg(height: 14.sp);
    }
  }
}
