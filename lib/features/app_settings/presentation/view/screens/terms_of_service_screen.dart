import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});
  static const String routeName = 'termsScreen';

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AGREEMENT',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isDark? AppColors.lightGreyColor: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      'Terms of Service',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                    Text(
                      'Last updated on 1/12/2025',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: isDark? AppColors.darkGreyColor : AppColors.lightGreyColor),
              _clauseBuilder(
                1,
                'HayatCare provides a digital healthcare platform designed to support users in managing their health journey. The application offers access to health-related information, tracking tools, and communication features in a secure and user-friendly environment.',
              ),
              _clauseBuilder(
                2,
                'HayatCare does not provide medical diagnosis, treatment, or emergency care services. All information available within the application is intended for general guidance only and should not replace professional medical consultation or advice.',
              ),
              _clauseBuilder(
                3,
                'Users agree to provide accurate, current, and complete information when creating an account and using the application. HayatCare is not responsible for any issues, delays, or inaccuracies resulting from false or outdated user information.',
              ),
              _clauseBuilder(
                4,
                'All content, including text, illustrations, interface designs, and features within the HayatCare application, is the exclusive property of HayatCare. Users may not copy, reproduce, distribute, or modify any part of the application without prior written permission.',
              ),
              _clauseBuilder(
                5,
                'User data is handled in accordance with applicable privacy and data protection standards. HayatCare takes reasonable measures to protect personal and health-related information.',
              ),
              _clauseBuilder(
                6,
                'HayatCare is not liable for direct or indirect damages arising from the use or inability to use the application, including reliance on provided content.',
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    CustomMainButton(
                      onPressed: Navigator.of(context).pop,
                      label: 'Accept and continue',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _clauseBuilder(int index, String description) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 20.w),
    child: Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clause $index:',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
