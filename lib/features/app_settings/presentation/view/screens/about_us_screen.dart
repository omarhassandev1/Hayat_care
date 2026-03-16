import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String routeName = 'aboutUsScreen';

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var locale = AppLocalizations.of(context)!;
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
                      locale.aboutUs,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 30.sp,
                          ),
                    ),
                    Text(
                      'Last updated on 1/12/2025',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                  ],
                ),
              ),
              Divider(
                color: isDark
                    ? AppColors.darkGreyColor
                    : AppColors.lightGreyColor,
              ),
              _sectionBuilder(
                context,
                null,
                'HayatCare is a digital healthcare platform focused on delivering a reliable, accessible, and user-centered health experience. Our goal is to support individuals in managing their health through intuitive design, thoughtful functionality, and secure technology.\nThe platform is designed to help users access health-related information, track personal data, and interact with healthcare services in a clear and efficient way. Every element of HayatCare is built with usability, clarity, and trust as core principles.',
              ),
              _sectionBuilder(
                context,
                'Our Mission',
                'Our mission is to empower individuals to make informed health decisions by providing simple, secure, and user-friendly digital healthcare solutions. We aim to bridge the gap between users and healthcare services through thoughtful design and meaningful technology.',
              ),
              _sectionBuilder(
                context,
                'Our Vision',
                'Our vision is to become a trusted digital healthcare companion that supports users throughout their health journey. We strive to create an ecosystem where technology enhances accessibility, encourages healthier lifestyles, and improves the overall healthcare experience.',
              ),
              _teamSectionBuilder(context),
              _sectionBuilder(
                context,
                'Our Commitment',
                'We are committed to privacy, security, and transparency. HayatCare is developed with respect for user data and follows best practices to ensure a safe and dependable experience.\nHayatCare does not replace medical professionals. Instead, it serves as a supportive tool that empowers users with clarity, structure, and confidence in their health journey.\nHayatCare is built on one principle: Well-designed experiences lead to better health decisions.',
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sectionBuilder(
    BuildContext context, String? title, String description) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
    child: Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title,
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

Widget _teamSectionBuilder(BuildContext context) {
  const List<Map<String, String>> teamMembers = [
    {'name': 'Antoine Michel', 'role': 'Ai engineer'},
    {'name': 'Hassan Fathy', 'role': 'Frontend Developer'},
    {'name': 'Mahmoud Baiomy', 'role': 'Backend Developer'},
    {'name': 'Omar Hassan', 'role': 'Mobile App Developer'},
    {'name': 'Omar Medhat', 'role': 'UI & UX Designer'},
    {'name': 'Youssef Salah', 'role': 'Backend Developer'},
  ];

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
    child: Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Design & Development Team',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'HayatCare was designed and developed by a collaborative UI/UX team, each member contributing specialized expertise:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        ...teamMembers.map(
          (member) => Padding(
            padding: EdgeInsets.only(left: 8.w, top: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    children: [
                      TextSpan(
                        text: member['name'],
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' — ${member['role']}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Together, the team worked to ensure a consistent visual system, smooth user flows, and an experience aligned with healthcare usability standards.',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
