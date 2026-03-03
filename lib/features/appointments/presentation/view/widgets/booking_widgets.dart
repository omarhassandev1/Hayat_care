import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import '../../cubit/booking_cubit.dart';
import '../../cubit/booking_state.dart';

class MonthHeader extends StatelessWidget {
  final DateTime selectedDate;

  const MonthHeader({super.key, required this.selectedDate});

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

class DateSelector extends StatelessWidget {
  final BookingSlotsLoaded state;

  const DateSelector({super.key, required this.state});

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
        final isSelected = slot.date.day == state.selectedDate.day &&
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
                color: AppColors.lightGreyColor.withValues(alpha: .4),
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

class TimeSlotGrid extends StatelessWidget {
  final BookingSlotsLoaded state;

  const TimeSlotGrid({super.key, required this.state});

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
              border: isSelected
                  ? null
                  : Border.all(
                color: AppColors.lightGreyColor.withValues(alpha: .4),
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