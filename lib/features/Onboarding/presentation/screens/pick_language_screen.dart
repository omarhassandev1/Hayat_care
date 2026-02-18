import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/Onboarding/data/onboarding_data.dart';
import 'package:hayat_care/features/Onboarding/presentation/screens/onboarding_screen.dart';
import 'package:hayat_care/features/Onboarding/presentation/widgets/header_widget.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/features/app_settings/presentation/cubit/app_settings_cubit.dart';

import '../../../../gen/assets.gen.dart';

class PickLanguageScreen extends StatelessWidget {
  const PickLanguageScreen({super.key});
  static const String routeName = 'pickLangScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OnboardingHeaderWidget(header: onBoardingData[0].header, index: 0),
          const SizedBox(height: 30),
          Assets.onboarding.illustrations.languageIllustration.image(
            width: 300.w,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomMainButton(
                      label: AppLocalizations.of(context)!.english,
                      onPressed: () {
                        context.read<AppSettingCubit>().changeLanguage('en');
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(OnBoardingScreen.routeName);
                      },
                      textStyle:  TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    CustomMainButton(
                      label: 'العربية',
                      onPressed: () {
                        context.read<AppSettingCubit>().changeLanguage('ar');
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(OnBoardingScreen.routeName);
                      },
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'cairo'
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
