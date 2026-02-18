import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: AppColors.lightGreyColor,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  errorWidget: (context, url, error) =>
                      Assets.profile.personErrorView.svg(
                        colorFilter: ColorFilter.mode(
                          AppColors.mainColor,
                          BlendMode.srcIn,
                        ),
                        height: 70.h,
                        width: 70.h,
                      ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Dr. Omar Khaled",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
            ),
            Text(
              "Virologist",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DoctorStatsCard(
                  value: "1000+",
                  label: "Patients",
                  icon: Assets.doctor.people.svg(),
                  bgColor: Color(0xff7ACEFA).withAlpha(50),
                ),
                DoctorStatsCard(
                  value: "10 Yrs",
                  label: "Experience",
                  icon: Assets.doctor.experience.svg(),
                  bgColor: Color(0xffecbbc0).withAlpha(80),
                ),
                DoctorStatsCard(
                  value: "4.8",
                  label: "Ratings",
                  icon: Assets.doctor.rating.svg(),
                  bgColor: Color(0xffffe3b4).withAlpha(80),
                ),
              ],
            ),
            SizedBox(height: 32.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.aboutDoctor,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Dr. Bellamy Nicholas is a top specialist at London Bridge Hospital at London. He has achieved several awards and recognition for his contribution and service in his own field.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: AppColors.blueishGreyColor,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.workingTime,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mon - Sat (08:30 AM - 09:00 PM)",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: AppColors.blueishGreyColor,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => [
                ReviewWidget(
                  imageUrl:
                      'https://img.freepik.com/free-photo/woman-with-beautiful-gladiolus-flowers_23-2149441357.jpg?semt=ais_hybrid&w=740&q=80',
                  name: 'Lauralee Quintero',
                  rating: 5,
                  ratingDetails:
                      '"Dr. Ahmed was very professional and attentive. He explained everything clearly."',
                ),
                ReviewWidget(
                  imageUrl:
                      'https://img.freepik.com/free-photo/woman-with-beautiful-gladiolus-flowers_23-2149441357.jpg?semt=ais_hybrid&w=740&q=80',
                  name: 'Lauralee Quintero',
                  rating: 5,
                  ratingDetails:
                      '"Dr. Ahmed was very professional and attentive. He explained everything clearly."',
                ),
              ][index],
              separatorBuilder: (context, index) => SizedBox(height: 32.h),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
          child: SizedBox(
            height: 57.h,
            child: Row(children: [CustomMainButton(label: 'Book Appointment')]),
          ),
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.ratingDetails,
  });
  final String imageUrl;
  final String name;
  final int rating;
  final String ratingDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30.h,
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(
              name,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_border, size: 16, color: Colors.blue),
                  SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            ratingDetails,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorStatsCard extends StatelessWidget {
  const DoctorStatsCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.bgColor,
  });
  final String value;
  final String label;
  final Widget icon;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.h),
      height: 145.h,
      width: 105.w,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : AppColors.darkCardColor,
        borderRadius: BorderRadius.circular(21.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 68.h,
            width: 46.w,
            padding: EdgeInsets.only(bottom: 8.h),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.r),
              ),
            ),
            child: icon,
          ),
          SizedBox(height: 16.h),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 4.h),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.darkGreyColor
                  : AppColors.lightGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
