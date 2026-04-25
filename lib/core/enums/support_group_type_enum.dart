import 'package:flutter/material.dart';
import 'package:hayat_care/localization/app_localizations.dart';

enum SupportGroupTypeEnum {
  addictionSupport,
  mentalHealth,
  chronicIllness,
  griefSupport,
  parentingSupport,
}

extension SupportGroupTypeEnumX on SupportGroupTypeEnum {
  String toLocalizedString(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    switch (this) {
      case SupportGroupTypeEnum.addictionSupport:
        return locale.addictionSupport;
      case SupportGroupTypeEnum.mentalHealth:
        return locale.mentalHealth;
      case SupportGroupTypeEnum.chronicIllness:
        return locale.chronicIllness;
      case SupportGroupTypeEnum.griefSupport:
        return locale.griefSupport;
      case SupportGroupTypeEnum.parentingSupport:
        return locale.parentingSupport;
    }
  }
}