import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/reschedule_reasons_screen.dart';
import 'package:hayat_care/features/appointments/presentation/view/widgets/cancel_appointment_bottom_sheet.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'appointment_card_header_v2.dart';

class UpcomingAppointmentCardV2 extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const UpcomingAppointmentCardV2({
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
            statusLabel: local.upcoming,
            statusColor: AppColors.mainColor,
          ),
          Divider(height: 0, thickness: .5, endIndent: 20.r),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.r),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.r),
                            ),
                          ),
                          builder: (_) => CancelAppointmentBottomSheet(
                            local: local,
                            appointmentWithDoctor: appointmentWithDoctor,
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
                          border: Border.all(color: Colors.red),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.close, color: Colors.red, size: 14.sp),
                            SizedBox(width: 4.w),
                            Text(
                              local.cancel,
                              style: TextStyle(
                                color: Colors.red,
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
                            builder: (_) => RescheduleReasonScreen(
                              appointmentWithDoctor: appointmentWithDoctor,
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
                          borderRadius: BorderRadiusGeometry.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 14.sp,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              local.reschedule,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
