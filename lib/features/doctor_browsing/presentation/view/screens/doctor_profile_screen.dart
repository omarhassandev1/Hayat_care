import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/book_appointments_screen.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_state.dart';
import 'package:hayat_care/features/reviews/presentation/view/screens/all_reviews_screen.dart';
import 'package:hayat_care/features/reviews/presentation/view/widgets/review_card.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../gen/assets.gen.dart';

import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';

class DoctorProfileScreen extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ReviewsCubit>()..loadReviews(doctor.id),
  child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundColor: AppColors.lightGreyColor,
                child: ClipOval(
                  child: CachedNetworkImage(
                    height: 120.r,
                    width: 120.r,
                    imageUrl: doctor.imageUrl,
                    fit: BoxFit.cover,
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
                doctor.name,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                doctor.specialty.toLocalizedString(context),
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DoctorStatsCard(
                    value: '${doctor.patientsCount}+',
                    label: AppLocalizations.of(context)!.patients,
                    icon: Assets.doctor.people.svg(),
                    bgColor: const Color(0xff7ACEFA).withAlpha(50),
                  ),
                  DoctorStatsCard(
                    value: '${doctor.experienceYears} Yrs',
                    label: AppLocalizations.of(context)!.experience,
                    icon: Assets.doctor.experience.svg(),
                    bgColor: const Color(0xffecbbc0).withAlpha(80),
                  ),
                  DoctorStatsCard(
                    value: doctor.rating.toString(),
                    label: AppLocalizations.of(context)!.ratings,
                    icon: Assets.doctor.rating.svg(),
                    bgColor: const Color(0xffffe3b4).withAlpha(80),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppLocalizations.of(context)!.aboutDoctor,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                doctor.about,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppLocalizations.of(context)!.workingTime,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  doctor.workingHours,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.reviews,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<ReviewsCubit>(),
                            child: AllReviewsScreen(doctor: doctor),
                          ),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.seeAll,
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
              BlocBuilder<ReviewsCubit, ReviewsState>(
                builder: (context, state) {
                  if (state is ReviewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ReviewsLoaded) {
                    if (state.reviews.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.noReviewsYet,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      );
                    }
                    final previewReviews = state.reviews.take(2).toList();
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: previewReviews.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemBuilder: (_, index) =>
                          ReviewCard(review: previewReviews[index]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
          child: SizedBox(
            height: 57.h,
            child: Row(
              children: [
                CustomMainButton(
                  label: AppLocalizations.of(context)!.bookAppointment,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            BookAppointmentScreen(doctor: doctor),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
