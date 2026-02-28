import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/doctor_browsing/presentation/view/screens/doctor_profile_screen.dart';

import '../../../../../gen/assets.gen.dart';

class BasicDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String hospital;
  final String rating;
  final String reviews;
  final String imagePath;

  const BasicDoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.reviews,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: !isDark ? Colors.white : AppColors.darkCardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DoctorProfileScreen()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                imagePath,
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  width: 110.w,
                  height: 110.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.labelSmall),
                    FavoriteButton(
                      onToggle: (isFav) {
                        print("Doctor $name favorite status: $isFav");
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Divider(
                  thickness: 0.5,
                  color: isDark
                      ? AppColors.lightGreyColor
                      : AppColors.darkGreyColor,
                ),
                SizedBox(height: 12.h),
                Text(
                  "$specialty  |  $hospital",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "$rating ($reviews reviews)",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BasicDoctorCardUpdated extends StatelessWidget {
  final String name;
  final String specialty;
  final String hospital;
  final String rating;
  final String reviews;
  final String imagePath;

  const BasicDoctorCardUpdated({
    super.key,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.reviews,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 170.h,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: !isDark ? Colors.white : AppColors.darkCardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 36,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DoctorProfileScreen(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.r),
                    bottomStart: Radius.circular(16.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Container(
                      color: AppColors.lightGreyColor,
                      child: Assets.profile.personErrorView.svg(
                        colorFilter: ColorFilter.mode(
                          AppColors.mainColor,
                          BlendMode.srcIn,
                        ),
                        height: 85.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 64,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FavoriteButton(
                          onToggle: (isFav) {
                            print("Doctor $name favorite status: $isFav");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Divider(
                      thickness: 0.5,
                      color: isDark
                          ? AppColors.lightGreyColor
                          : AppColors.darkGreyColor,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "$specialty  |  $hospital",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_rounded,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "$rating ($reviews reviews)",
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final Function(bool isFavorite)? onToggle;
  final bool initialValue;

  const FavoriteButton({super.key, this.onToggle, this.initialValue = true});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (widget.onToggle != null) {
          widget.onToggle!(isFavorite);
        }
      },
      child: Icon(
        Icons.favorite_border,
        color: isFavorite ? AppColors.redColor : AppColors.mainColor,
        size: 24.sp,
      ),
    );
  }
}
