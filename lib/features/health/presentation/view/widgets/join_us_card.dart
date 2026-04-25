import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/health/presentation/cubits/health_cubit/health_cubit.dart';
import 'package:hayat_care/features/health/presentation/view/screens/group_session_patient_details_screen.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/activity_button.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/activity_grid_view.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';

class JoinUsCard extends StatefulWidget {
  const JoinUsCard({super.key, required this.isSeeAllButtonAvailable});

  final bool isSeeAllButtonAvailable;

  @override
  State<JoinUsCard> createState() => _JoinUsCardState();
}

class _JoinUsCardState extends State<JoinUsCard> {
  late bool isActivityVisible;
  @override
  void initState() {
    super.initState();
    isActivityVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        end: 3.h,
        bottom: 24.h,
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            children: [
              Text(
                locale.groupSessions,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              if (widget.isSeeAllButtonAvailable == true)
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 17.r),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isActivityVisible = !isActivityVisible;
                      });
                    },
                    child: Row(
                      spacing: 5,
                      children: [
                        Text(
                          locale.myActivity,
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                        if (isActivityVisible)
                          Transform.rotate(
                            angle: 90 * pi / 180,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.mainColor,
                              size: 20,
                            ),
                          )
                        else
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.mainColor,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1,
                  child: child,
                ),
              );
            },
            child: isActivityVisible
                ? Padding(
                    key: const ValueKey(true),
                    padding: EdgeInsetsDirectional.only(end: 13.r),
                    child: ActivityGridView(
                      itemCount: 3,
                      buttons: [
                        ActivityButton(
                          color: AppColors.mainColor,
                          icon: Icon(
                            Icons.schedule_rounded,
                            color: AppColors.mainColor,
                          ),
                          title: locale.upcoming,
                        ),
                        ActivityButton(
                          color: AppColors.greenColor,
                          icon: Icon(Icons.check, color: AppColors.greenColor),
                          title: locale.attended,
                        ),
                        ActivityButton(
                          color: AppColors.redColor,
                          icon: Icon(Icons.close, color: AppColors.redColor),
                          title: locale.cancelled,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(key: ValueKey(false)),
          ),
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Column(
                        spacing: 12.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 270.w,
                            child: Text(
                              AppLocalizations.of(context)!.oneBraveStep,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              AppLocalizations.of(context)!.saveLifeByReaching,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => sl<HealthCubit>(),
                                  child:
                                      const GroupSessionPatientDetailsScreen(),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.mainColor,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.joinUs,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              ),
              PositionedDirectional(
                end: 0.w,
                bottom: 0.h,
                child: Assets.home.common.joinUs.svg(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
