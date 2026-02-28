// core/enums/doctor_specialty_enum.dart

import 'package:flutter/material.dart';
import 'package:hayat_care/localization/app_localizations.dart';

enum DoctorSpecialtyEnum {
  general,
  dentist,
  nutrition,
  heart,
  bones,
  addiction,
  cardiologists,
  dermatology,
  orthopedics,
  neurology,
  pediatrics,
}

extension DoctorSpecialtyEnumX on DoctorSpecialtyEnum {
  String toLocalizedString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    switch (this) {
      case DoctorSpecialtyEnum.general:       return l.specialty_general;
      case DoctorSpecialtyEnum.dentist:       return l.specialty_dentist;
      case DoctorSpecialtyEnum.nutrition:     return l.specialty_nutrition;
      case DoctorSpecialtyEnum.heart:         return l.specialty_heart;
      case DoctorSpecialtyEnum.bones:         return l.specialty_bones;
      case DoctorSpecialtyEnum.addiction:     return l.specialty_addiction;
      case DoctorSpecialtyEnum.cardiologists: return l.cardiologists;
      case DoctorSpecialtyEnum.dermatology:   return l.dermatology;
      case DoctorSpecialtyEnum.orthopedics:   return l.orthopedics;
      case DoctorSpecialtyEnum.neurology:     return l.neurology;
      case DoctorSpecialtyEnum.pediatrics:    return l.pediatrics;
    }
  }
}