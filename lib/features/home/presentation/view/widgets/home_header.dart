import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/favorite_doctors/presentation/view/screens/favorite_doctors_screen.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
                  imageUrl:
                      'https://instagram.fcai19-8.fna.fbcdn.net/v/t51.2885-19/628267385_18394191415178409_3764287358818384500_n.jpg?stp=dst-jpg_s320x320_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fcai19-8.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QGSaOecX26YZpTCmVMVU1-Y0auag-kkP6YV8Wvqes4Qr6AfhdJD20Pf2JJyQemkeJ0&_nc_ohc=7sFEQzgPqTAQ7kNvwEVGo4X&_nc_gid=9NUHZRAFwuVg_8KC7_Fh0A&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfumVa8eg_W-8qfIqt8EH44djw97Op2_2Eit91_qc1tvOQ&oe=69979FEF&_nc_sid=8b3546',
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
                    'Omar Hassan',
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
