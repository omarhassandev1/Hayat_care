import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  static const String routeName = 'policyScreen';

  @override
  Widget build(BuildContext context) {
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
                        color: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 30.sp,
                      ),
                    ),
                    Text(
                      'Last updated on 1/12/2025',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.lightGreyColor),
              _clauseBuilder(
                1,
                'HayatCare respects and protects user privacy. This Privacy Policy explains how personal and health-related information is collected, used, and managed when users access and interact with the application.',
              ),
              _clauseBuilder(
                2,
                'HayatCare may collect personal information such as name, email address, date of birth, and other details provided during account creation or app usage. Health-related data may also be collected to enable app features and improve user experience.',
              ),
              _clauseBuilder(
                3,
                'Collected information is used to operate, maintain, and improve HayatCare services. This includes personalizing content, enabling core functionalities, communicating with users, and ensuring platform security.',
              ),
              _clauseBuilder(
                4,
                'Users have the right to access, update, or request deletion of their personal information, subject to applicable laws and operational requirements. Requests can be submitted through the app or support channels.',
              ),
              _clauseBuilder(
                5,
                'HayatCare may use cookies or similar technologies to enhance app functionality and analyze usage patterns. These technologies help improve performance and user experience without compromising privacy.',
              ),
              _clauseBuilder(
                6,
                'This Privacy Policy may be updated periodically to reflect changes in services, technology, or legal requirements. Continued use of HayatCare after updates indicates acceptance of the revised policy.',
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
            color: AppColors.blackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
