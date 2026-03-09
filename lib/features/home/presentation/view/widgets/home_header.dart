import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/favorite_doctors/presentation/view/screens/favorite_doctors_screen.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final user = state is ProfileLoaded ? state.user : null;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightGreyColor,
                  radius: 25.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: CachedNetworkImage(
                      height: 50.h,
                      width: 50.h,
                      imageUrl: user?.imageUrl ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Assets.profile.personErrorView.svg(
                            colorFilter: ColorFilter.mode(
                              AppColors.mainColor,
                              BlendMode.srcIn,
                            ),
                            height: 30.h,
                            width: 30.h,
                          ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.goodMorning,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: isDark
                              ? AppColors.lightGreyColor
                              : AppColors.darkGreyColor,
                        ),
                      ),
                      Text(
                        user?.name.trim().split(' ').first ?? '',
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                _buildActionIcon(
                  icon: Assets.home.common.notifications.svg(
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      isDark ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {},
                ),
                _buildActionIcon(
                  icon: Assets.home.common.ai.svg(
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      isDark ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {},
                ),
                _buildActionIcon(
                  icon: Assets.home.common.favorite.svg(
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      isDark ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(FavoriteDoctorsScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionIcon({
    required Widget icon,
    required void Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: icon,
      ),
    );
  }
}
