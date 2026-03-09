import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/success_dialog.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/reviews/domain/entities/review_entity.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_state.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';
import '../../../../../gen/assets.gen.dart';

class RateDoctorScreen extends StatefulWidget {
  final DoctorEntity doctor;
  final bool shouldReloadOnSuccess;

  const RateDoctorScreen({
    super.key,
    required this.doctor,
    this.shouldReloadOnSuccess = false,
  });

  @override
  State<RateDoctorScreen> createState() => _RateDoctorScreenState();
}

class _RateDoctorScreenState extends State<RateDoctorScreen> {
  int _selectedStars = 0;
  bool? _wouldRecommend;
  final TextEditingController _reviewController = TextEditingController();

  bool get _isValid => _selectedStars > 0 && _wouldRecommend != null;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final local = AppLocalizations.of(context)!;
    final doctor = widget.doctor;

    return BlocListener<ReviewsCubit, ReviewsState>(
      listener: (context, state) {
        if (state is ReviewSubmitSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => SuccessDialog(
              title: local.thankYouForReview,
              subtitle: '${local.reviewSubmittedSubtitle} ${doctor.name}.',
              primaryButtonText: local.ok,
              onPrimaryPressed: () {
                final cubit = context.read<ReviewsCubit>();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                if (widget.shouldReloadOnSuccess) {
                  cubit.loadReviews(doctor.id);
                }
              },
            ),
          );
        } else if (state is ReviewSubmitError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.rateDoctor,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  children: [
                    // Doctor info card
                    CircleAvatar(
                      radius: 65.r,
                      backgroundColor: AppColors.lightGreyColor,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: doctor.imageUrl,
                          width: 130.r,
                          height: 130.r,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) =>
                              Assets.profile.personErrorView.svg(
                                colorFilter: ColorFilter.mode(
                                  AppColors.mainColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // How was your experience
                    Text(
                      '${local.howWasYourExperience}\n${doctor.name}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(fontSize: 18.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),

                    // Stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final starIndex = index + 1;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedStars = starIndex),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                starIndex <= _selectedStars
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                key: ValueKey(starIndex <= _selectedStars),
                                color: starIndex <= _selectedStars
                                    ? AppColors.mainColor
                                    : Colors.grey.shade400,
                                size: 40.r,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 32.h),
                    Divider(height: 1.5.h),
                    SizedBox(height: 32.h),

                    // Write your review
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        local.writeYourReview,
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextField(
                      controller: _reviewController,
                      maxLines: 5,
                      onChanged: (_) => setState(() {}),
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: local.writeYourReviewHint,
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        filled: true,
                        fillColor: isDark
                            ? AppColors.darkCardColor
                            : Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Would you recommend
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '${local.wouldYouRecommend} ${doctor.name}${local.toYourFriends}',
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    RadioGroup<bool>(
                      groupValue: _wouldRecommend,
                      onChanged: (val) => setState(() => _wouldRecommend = val),
                      child: Row(
                        children: [
                          _RecommendOption(label: local.yes, value: true),
                          SizedBox(width: 24.w),
                          _RecommendOption(label: local.no, value: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Submit button
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 24.h,
                top: 8.h,
              ),
              child: SizedBox(
                height: 57.h,
                child: Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        CustomMainButton(
                          label: local.submitReview,
                          fillColor: _isValid
                              ? AppColors.mainColor
                              : AppColors.mainColor.withValues(alpha: 0.4),
                          onPressed: _isValid
                              ? () {
                                  final profileState = context
                                      .read<ProfileCubit>()
                                      .state;
                                  final user = profileState is ProfileLoaded
                                      ? profileState.user
                                      : null;

                                  context.read<ReviewsCubit>().submitReview(
                                    ReviewEntity(
                                      id: DateTime.now().millisecondsSinceEpoch
                                          .toString(),
                                      doctorId: doctor.id,
                                      patientName: user?.name ?? 'Anonymous',
                                      patientImageUrl: user?.imageUrl ?? '',
                                      rating: _selectedStars,
                                      comment: _reviewController.text.trim(),
                                      wouldRecommend: _wouldRecommend!,
                                      createdAt: DateTime.now(),
                                    ),
                                  );
                                }
                              : null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendOption extends StatelessWidget {
  final String label;
  final bool value;

  const _RecommendOption({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<bool>(value: value, activeColor: AppColors.mainColor),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
