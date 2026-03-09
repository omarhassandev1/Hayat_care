import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/reviews/domain/entities/review_entity.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_state.dart';
import 'package:hayat_care/features/reviews/presentation/view/screens/rate_doctor_screen.dart';
import 'package:hayat_care/features/reviews/presentation/view/widgets/review_card.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class AllReviewsScreen extends StatefulWidget {
  final DoctorEntity doctor;

  const AllReviewsScreen({super.key, required this.doctor});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  int? _selectedFilter;

  List<ReviewEntity> _applyFilter(List<ReviewEntity> reviews) {
    if (_selectedFilter == null) return reviews;
    return reviews.where((r) => r.rating == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final doctor = widget.doctor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${doctor.rating}(${doctor.reviewsCount} ${local.reviews})',
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          if (state is ReviewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ReviewsLoaded) {
            final filtered = _applyFilter(state.reviews);
            return Column(
              children: [
                SizedBox(
                  height: 55.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    children: [
                      _FilterChip(
                        label: local.all,
                        isSelected: _selectedFilter == null,
                        onTap: () => setState(() => _selectedFilter = null),
                      ),
                      ...List.generate(5, (i) {
                        final star = 5 - i;
                        return _FilterChip(
                          label: '$star',
                          isSelected: _selectedFilter == star,
                          onTap: () => setState(() => _selectedFilter = star),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                // Reviews list
                Expanded(
                  child: filtered.isEmpty
                      ? Center(
                          child: Text(
                            local.noReviewsYet,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) => Column(
                            children: [
                              SizedBox(height: 16.h),
                              const Divider(thickness: 0.5),
                              SizedBox(height: 16.h),
                            ],
                          ),
                          itemBuilder: (_, index) =>
                              ReviewCard(review: filtered[index]),
                        ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ReviewsCubit>(),
                child: RateDoctorScreen(doctor: doctor, shouldReloadOnSuccess: true,),
              ),
            ),
          );
        },
        backgroundColor: AppColors.mainColor,
        icon: const Icon(Icons.rate_review_outlined, color: Colors.white),
        label: Text(
          local.rateDoctor,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : Colors.transparent,
          border: Border.all(color: AppColors.mainColor,width: 2.r),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          spacing: 4.w,
          children: [
            Icon(
              Icons.star_border_rounded,
              color: isSelected ? Colors.white : AppColors.mainColor,
              size: 20.h,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
