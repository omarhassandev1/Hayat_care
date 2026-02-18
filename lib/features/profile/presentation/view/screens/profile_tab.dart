import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/settings_screen.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../app_settings/presentation/view/widgets/settings_item.dart';
import '../widgets/profile_tab_header.dart';
import '../../../../app_settings/presentation/view/widgets/settings_group.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileTabHeader(isDark: isDark),

            SizedBox(height: 16.h),

            Text(
              AppLocalizations.of(context)!.generalSettings,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            SettingsGroup(items: [
              SettingsItem(
                icon: Assets.profile.profile.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.profile,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.family.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.family,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.settings.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.settings,
                isDark: isDark,
                onPressed: (){
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                },
              ),
            ],isDark:  isDark),

            SizedBox(height: 25.h),

            Text(
              AppLocalizations.of(context)!.otherSettings,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            SettingsGroup(items: [
              SettingsItem(
                icon: Assets.profile.helpCenter.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.helpCenter,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.aboutUsIcon.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.aboutUs,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.termsOfUse.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.termsOfUse,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.privacyPolicy.svg(
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                title: AppLocalizations.of(context)!.privacyPolicy,
                isDark: isDark,
              ),
              SettingsItem(
                icon: Assets.profile.logout.svg(),
                title: AppLocalizations.of(context)!.logout,
                isDark: isDark,
                textColor: AppColors.redColor,
                iconColor: AppColors.redColor,
              ),
            ], isDark: isDark,),

            SizedBox(height: 30.h),

            Center(
              child: Text(AppLocalizations.of(context)!.followUsOnSocialMedia, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Assets.profile.linkedin.svg()),
                _buildSocialIcon(Assets.profile.x.svg()), 
                _buildSocialIcon(Assets.profile.instagram.svg()), 
                _buildSocialIcon(Assets.profile.facebook.svg()), 
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }



  Widget _buildSocialIcon(Widget icon) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Container(child: icon),
      ),
    );
  }
}
