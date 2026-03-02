import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/patient_booking_details.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../cubit/booking_cubit.dart';
import '../../cubit/booking_state.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorEntity doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => sl<BookingCubit>()..loadSlots(doctor.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.bookAppointment,
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
                          _MonthHeader(selectedDate: state.selectedDate),
                          SizedBox(height: 16.h),
                          _DateSelector(state: state),
                          SizedBox(height: 32.h),
                          Text(
                            local.availableTime,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(height: 16.h),
                          _TimeSlotGrid(state: state),
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
                                  label: local.next,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            PatientBookingDetailsScreen(
                                              doctor: doctor,
                                              selectedDate: state.selectedDate,
                                              selectedTime: state.selectedTime!,
                                            ),
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

class _MonthHeader extends StatelessWidget {
  final DateTime selectedDate;

  const _MonthHeader({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat('MMM, yyyy').format(selectedDate),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const Icon(Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}

class _DateSelector extends StatelessWidget {
  final BookingSlotsLoaded state;

  const _DateSelector({required this.state});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 8 / 9,
      ),
      itemCount: state.slots.length,
      itemBuilder: (context, index) {
        final slot = state.slots[index];
        final isSelected =
            slot.date.day == state.selectedDate.day &&
            slot.date.month == state.selectedDate.month;

        return GestureDetector(
          onTap: () => context.read<BookingCubit>().selectDate(slot.date),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.mainColor
                  : isDark
                  ? AppColors.darkCardColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: isSelected
                  ? null
                  : Border.all(
                      color: isDark
                          ? AppColors.lightGreyColor.withValues(alpha: .4)
                          : AppColors.lightGreyColor.withValues(alpha: .4),
                    ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  slot.date.day.toString(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: isSelected ? Colors.white : null,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormat('EEE').format(slot.date),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isSelected ? Colors.white : null,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TimeSlotGrid extends StatelessWidget {
  final BookingSlotsLoaded state;

  const _TimeSlotGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final times = state.availableTimesForSelectedDate;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 2.5,
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final time = times[index];
        final isSelected = time == state.selectedTime;

        return GestureDetector(
          onTap: () => context.read<BookingCubit>().selectTime(time),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.mainColor
                  : isDark
                  ? AppColors.darkCardColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: isSelected? null : Border.all(
                color: isDark
                    ? AppColors.lightGreyColor.withValues(alpha: .4)
                    : AppColors.lightGreyColor.withValues(alpha: .4),
              ),
            ),
            child: Center(
              child: Text(
                time,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: isSelected ? Colors.white : null,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
