import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/gen/assets.gen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class HomeAppointmentCard extends StatelessWidget {
  const HomeAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      height: 160.h,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Image.asset(
              'assets/mock/image-removebg-preview.png',
              height: 150.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.nextAppointment,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${AppLocalizations.of(context)!.doctor}: Ahmed Nader Abdullah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,

                  ),
                ),
                Row(
                  children: [
                    Assets.home.common.date.svg(),
                    SizedBox(width: 5.w),
                    Text(
                      'Thursday, Nov 13',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'

                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
                Row(
                  children: [
                    Assets.home.common.time.svg(),
                    SizedBox(width: 5.w),
                    Text(
                      '9:30 - 10:30 AM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'

                      ),
                    ),
                    SizedBox(width: 15),
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
