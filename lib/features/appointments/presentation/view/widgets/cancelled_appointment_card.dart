import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'appointment_card_header.dart';

class CancelledAppointmentCard extends StatelessWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const CancelledAppointmentCard({super.key, required this.appointmentWithDoctor});

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
        child: AppointmentCardHeader(
          doctor: doctor,
          dateTime: appointment.dateTime,
          statusLabel: local.cancelled,
          statusColor: Colors.red,
        ),
      ),
    );
  }
}