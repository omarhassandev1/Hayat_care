import 'package:flutter/material.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../../../../core/widgets/success_dialog.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../login/widgets/auth_header.dart';
import '../../login/widgets/brand_widget.dart';
import '../../terms_and_conditions/widgets/terms_of_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'signupScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  title: AppLocalizations.of(context)!.createAccount,
                  brief:
                      AppLocalizations.of(context)!.createAccountSubtitle,
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.fullName,
                  hintText: AppLocalizations.of(context)!.fullNameHint,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.emailHint,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.mobileNumber,
                  hintText: AppLocalizations.of(context)!.mobileNumberHint,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  isPassword: true,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomMainButton(
                      label: AppLocalizations.of(context)!.createAccountButton,

                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SuccessDialog(
                            title: AppLocalizations.of(context)!.accountCreatedTitle,
                            subtitle:
                                AppLocalizations.of(context)!.accountCreatedSubtitle,
                            primaryButtonText: AppLocalizations.of(context)!.loginNow,
                            onPrimaryPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            secondaryButtonText: AppLocalizations.of(context)!.cancel,
                            onSecondaryPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.alreadyHaveAccount,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signIn,
                        style: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: AppColors.mainColor),
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
                SizedBox(height: 10.h),
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
                SizedBox(height: 10.h),
                TermsOfService(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
