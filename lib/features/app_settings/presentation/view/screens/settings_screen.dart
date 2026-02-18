import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/Auth/presentation/view/change_email_password/change_email_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/language_bottom_sheet.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/settings_group.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../Auth/presentation/view/change_email_password/change_password_screen.dart';
import '../widgets/delete_account_bottom_sheet.dart';
import '../widgets/settings_item.dart';
import '../widgets/theme_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'settingsScreen';

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: SettingsGroup(
          items: [
            SettingsItem(
              icon: Icon(Icons.email_outlined),
              title: AppLocalizations.of(context)!.changeEmail,
              isDark: isDark,
              onPressed: () {
                Navigator.of(context).pushNamed(ChangeEmailScreen.routeName);
              },
            ),
            SettingsItem(
              icon: Icon(Icons.lock_outline_rounded),
              title: AppLocalizations.of(context)!.changePassword,
              isDark: isDark,
              onPressed: () {
                Navigator.of(context).pushNamed(ChangePasswordScreen.routeName);
              },
            ),
            SettingsItem(
              icon: Icon(Icons.language),
              title: AppLocalizations.of(context)!.language,
              isDark: isDark,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  builder: (context) => const LanguageBottomSheet(),
                );
              },
            ),
            SettingsItem(
              icon: Icon(Icons.dark_mode_outlined),
              title: AppLocalizations.of(context)!.appearance,
              isDark: isDark,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  builder: (context) => const ThemeBottomSheet(),
                );
              },
            ),
            SettingsItem(
              icon: Icon(
                Icons.delete_outline_rounded,
                color: AppColors.redColor,
              ),
              title: AppLocalizations.of(context)!.deleteAccount,
              isDark: isDark,
              iconColor: AppColors.redColor,
              textColor: AppColors.redColor,
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  showDragHandle: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  context: context,
                  builder: (context) => DeleteAccountBottomSheet(),
                );
              },
            ),
          ],
          isDark: isDark,
        ),
      ),
    );
  }
}

