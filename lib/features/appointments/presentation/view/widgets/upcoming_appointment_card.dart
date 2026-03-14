import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/reschedule_reasons_screen.dart';
import 'package:hayat_care/features/appointments/presentation/view/widgets/cancel_appointment_bottom_sheet.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'appointment_card_header.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const UpcomingAppointmentCard({super.key, required this.appointmentWithDoctor});

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
              statusLabel: local.upcoming,
              statusColor: AppColors.mainColor,
            ),
            SizedBox(height: 12.h),
            Divider(
              thickness: 0.5,
              color: isDark ? AppColors.lightGreyColor : AppColors.darkGreyColor,
            ),
            SizedBox(height: 12.h),
            Row(
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
                        builder: (_) => CancelAppointmentBottomSheet(local: local, appointmentWithDoctor: appointmentWithDoctor),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 9.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text(
                        local.cancelAppointment,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RescheduleReasonScreen(
                            appointmentWithDoctor: appointmentWithDoctor,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      local.reschedule,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 13.sp, color: Colors.white),
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

