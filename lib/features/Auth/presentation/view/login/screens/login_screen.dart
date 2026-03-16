import 'package:flutter/material.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../layout/presentation/view/main_layout_view.dart';
import '../../forget_password/screens/forget_password_screen.dart';
import '../../signup/screens/signup_screen.dart';
import '../widgets/terms_of_service.dart';
import '../widgets/auth_header.dart';
import '../widgets/brand_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                AuthHeader(
                  title: AppLocalizations.of(context)!.welcome,
                  brief: AppLocalizations.of(context)!.welcomeSubtitle,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.emailHint,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  isPassword: true,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomMainButton(
                      label: AppLocalizations.of(context)!.login,
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(MainLayoutView.routeName);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                        indent: 5.w,
                        endIndent: 12.w,
                        thickness: 1.2,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.greyColor,
                        indent: 12.w,
                        endIndent: 5.w,
                        thickness: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 32.w,
                  children: [
                    BrandWidget(
                      brandImage: Assets.authentication.logos.google.svg(),
                    ),
                    BrandWidget(
                      brandImage: Assets.authentication.logos.facebook.svg(),
                    ),
                    BrandWidget(
                      brandImage: Assets.authentication.logos.icloud.svg(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TermsOfService(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
