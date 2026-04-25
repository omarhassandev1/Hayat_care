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
import 'appointment_card_header.dart';

class CompletedAppointmentCard extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const CompletedAppointmentCard({
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
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            AppointmentCardHeader(
              doctor: doctor,
              dateTime: appointment.dateTime,
              statusLabel: local.completed,
              statusColor: AppColors.greenColor,
            ),
            SizedBox(height: 12.h),
            Divider(
              thickness: 0.5,
              color: isDark
                  ? AppColors.lightGreyColor
                  : AppColors.darkGreyColor,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BookAppointmentScreen(doctor: doctor),
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
                      child: Text(
                        local.bookAgain,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
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
                      child: Text(
                        local.leaveAReview,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
