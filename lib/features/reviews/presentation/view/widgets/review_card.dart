import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/reviews/domain/entities/review_entity.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  final ReviewEntity review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.lightGreyColor,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: review.patientImageUrl,
                fit: BoxFit.cover,
                width: 48.r,
                height: 48.r,
                errorWidget: (_, __, ___) =>
                const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          title: Text(
            review.patientName,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_border_rounded,
                    size: 16.r, color: AppColors.mainColor),
                SizedBox(width: 4.w),
                Text(
                  review.rating.toString(),
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
        SizedBox(height: 8.h),
        Text(
          review.comment,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          DateFormat('MMM d, yyyy').format(review.createdAt),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}