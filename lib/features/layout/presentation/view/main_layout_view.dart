import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../articles/presentation/view/screens/articles_tab.dart';
import '../../../health/presentation/view/screens/health_tab.dart';
import '../../../home/presentation/view/screens/home_tab.dart';
import '../../../profile/presentation/view/screens/profile_tab.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});
  static const String routeName = 'mainLayoutView';

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<LayoutCubit>(context);

          return Scaffold(
            body: IndexedStack(
              index: cubit.currentIndex,
              children: [
                HomeView(),
                _buildPlaceholderScreen('Care (Appointments)', Colors.amber),
                HealthTab(),
                ArticlesTab(),
                ProfileTab(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeBottomNav(index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedItemColor: AppColors.mainColor,
              unselectedItemColor: isDark
                  ? AppColors.lightGreyColor
                  : AppColors.greyColor,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              showUnselectedLabels: true,
              elevation: 0.h,
              items: [
                _buildBottomNavItem(
                  icon: Assets.bottomNavBar.home.svg(
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.lightGreyColor : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  activeIcon: Assets.bottomNavBar.activeHome.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  label: AppLocalizations.of(context)!.home,
                  isSelected: cubit.currentIndex == 0,
                ),
                _buildBottomNavItem(
                  icon: Assets.bottomNavBar.care.svg(
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.lightGreyColor : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  activeIcon: Assets.bottomNavBar.activeCare.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  label: AppLocalizations.of(context)!.care,
                  isSelected: cubit.currentIndex == 1,
                ),
                _buildBottomNavItem(
                  icon: Assets.bottomNavBar.health.svg(
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.lightGreyColor : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  activeIcon: Assets.bottomNavBar.activeHealth.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  label: AppLocalizations.of(context)!.health,
                  isSelected: cubit.currentIndex == 2,
                ),
                _buildBottomNavItem(
                  icon: Assets.bottomNavBar.article.svg(
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.lightGreyColor : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  activeIcon: Assets.bottomNavBar.activeArticle.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  label: AppLocalizations.of(context)!.article,
                  isSelected: cubit.currentIndex == 3,
                ),
                _buildBottomNavItem(
                  icon: Assets.bottomNavBar.profile.svg(
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.lightGreyColor : AppColors.greyColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  activeIcon: Assets.bottomNavBar.activeProfile.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  label: AppLocalizations.of(context)!.profile,
                  isSelected: cubit.currentIndex == 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required Widget icon,
    required Widget activeIcon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: 10.h),
            height: 3.h,
            width: isSelected ? 50.w : 0.w,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          isSelected ? activeIcon : icon,
        ],
      ),
      label: label,
    );
  }

  Widget _buildPlaceholderScreen(String title, Color color) {
    return Container(
      color: color.withValues(alpha: 0.1),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
