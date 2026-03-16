import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/contact_support_screen.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/settings_group.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/settings_item.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  static const String routeName = 'helpCenterScreen';

  static const String _supportPhoneNumber = '+201551323700';

  Future<void> _launchPhone(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: _supportPhoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open phone dialer')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.helpCenter,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SettingsGroup(
          isDark: isDark,
          items: [
            SettingsItem(
              icon: const Icon(Icons.phone_outlined),
              title: locale.callUs,
              isDark: isDark,
              onPressed: () => _launchPhone(context),
            ),
            SettingsItem(
              icon: const Icon(Icons.email_outlined),
              title: locale.sendAnEmail,
              isDark: isDark,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ContactSupportScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
