import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/success_dialog.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_entity.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../cubit/booking_cubit.dart';
import '../../cubit/booking_state.dart';
import '../widgets/booking_widgets.dart';

class RescheduleAppointmentScreen extends StatelessWidget {
  final DoctorEntity doctor;
  final AppointmentEntity appointment;

  const RescheduleAppointmentScreen({
    super.key,
    required this.doctor,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => sl<BookingCubit>()..loadSlots(doctor.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.reschedule,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookingError) {
              return Center(child: Text(state.message));
            }

            if (state is BookingSlotsLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MonthHeader(selectedDate: state.selectedDate),
                          SizedBox(height: 16.h),
                          DateSelector(state: state),
                          SizedBox(height: 32.h),
                          Text(
                            local.availableTime,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(height: 16.h),
                          TimeSlotGrid(state: state),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 24.h,
                      top: 8.h,
                    ),
                    child: SizedBox(
                      height: 57.h,
                      child: Row(
                        children: [
                          state.selectedTime == null
                              ? CustomMainButton(
                                  label: local.next,
                                  fillColor: AppColors.mainColor.withValues(
                                    alpha: .40,
                                  ),
                                )
                              : CustomMainButton(
                                  label: local.confirm,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => SuccessDialog(
                                        title:
                                            local.appointmentRescheduledTitle,
                                        subtitle:
                                            '${local.appointmentRescheduledSubtitle1} ${doctor.name} ${local.appointmentRescheduledSubtitle2} ${DateFormat('MMM dd, yyyy').format(state.selectedDate)} ${local.appointmentRescheduledSubtitle3} ${state.selectedTime}.',
                                        primaryButtonText: local.confirm,
                                        onPrimaryPressed: () {
                                          Navigator.popUntil(
                                            context,
                                            (route) => route.isFirst,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
