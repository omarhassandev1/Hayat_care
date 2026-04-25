import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/book_appointments_screen.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:hayat_care/features/reviews/presentation/view/screens/rate_doctor_screen.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'appointment_card_header_v2.dart';

class CompletedAppointmentCardV2 extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const CompletedAppointmentCardV2({
    super.key,
    required this.appointmentWithDoctor,
  });

  @override
  Widget build(BuildContext context) {
    final appointment = appointmentWithDoctor.appointment;
    final doctor = appointmentWithDoctor.doctor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final local = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          AppointmentCardHeaderV2(
            doctor: doctor,
            dateTime: appointment.dateTime,
            statusLabel: local.completed,
            statusColor: AppColors.greenColor,
          ),
          Divider(height: 0, thickness: .5, endIndent: 20.r),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.r),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BookAppointmentScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.mainColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh_outlined,
                            color: AppColors.mainColor,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            local.bookAgain,
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => sl<ReviewsCubit>(),
                            child: RateDoctorScreen(
                              doctor: appointmentWithDoctor.doctor,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_outline,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            local.leaveAReview,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontSize: 13.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
