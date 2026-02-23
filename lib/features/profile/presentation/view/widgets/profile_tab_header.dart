import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileTabHeader extends StatelessWidget {
  const ProfileTabHeader({super.key, required this.isDark});

  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [Color(0xFF1E3A8A), Color(0xFF0F172A)]
              : [Colors.blueAccent, Colors.blue[50]!],
        ),
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileError) {
            return Center(
              child: Column(
                spacing: 10.h,
                children: [
                  isDark
                      ? Assets.profile.disapointedIconBright.svg()
                      : Assets.profile.disapointedIconFilled.svg(),
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          } else if (state is ProfileLoaded) {
            final currentUser = state.user;

            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightGreyColor,
                  radius: 50.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: currentUser.imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: currentUser.imageUrl!,
                            errorWidget: (context, url, error) =>
                                Assets.profile.personErrorView.svg(
                                  colorFilter: ColorFilter.mode(
                                    AppColors.mainColor,
                                    BlendMode.srcIn,
                                  ),
                                  height: 100.h,
                                  width: 100.h,
                                ),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Assets.profile.personErrorView.svg(
                            colorFilter: ColorFilter.mode(
                              AppColors.mainColor,
                              BlendMode.srcIn,
                            ),
                            height: 60.h,
                            width: 60.h,
                          ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  currentUser.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  currentUser.email,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[isDark ? 300 : 700],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: SizedBox(
                height: 100.h,
                child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.mainColor,
                  size: 50.r,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
