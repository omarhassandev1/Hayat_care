import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/terms_of_service_screen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../app_settings/presentation/view/screens/privacy_policy_screen.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({
    super.key,
  }) ;


  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  late TapGestureRecognizer _termsRecognizer;
  late TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(TermsOfServiceScreen.routeName);
      };
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(PrivacyPolicyScreen.routeName);
      };
  }
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign:
      TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.sp,height: 1.5.h),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.terms_agreement_part1,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.terms_of_service,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: _termsRecognizer,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.terms_agreement_part2,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.privacy_policy,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer:
            _privacyRecognizer,
          ),
        ],
      ),
    );
  }
}
