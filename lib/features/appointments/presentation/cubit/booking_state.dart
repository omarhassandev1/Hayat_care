import '../../domain/entities/time_slot_entity.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSlotsLoaded extends BookingState {
  final List<TimeSlotEntity> slots;
  final DateTime selectedDate;
  final String? selectedTime;

  BookingSlotsLoaded({
    required this.slots,
    required this.selectedDate,
    this.selectedTime,
  });

  BookingSlotsLoaded copyWith({
    DateTime? selectedDate,
    String? selectedTime,
  }) {
    return BookingSlotsLoaded(
      slots: slots,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }

  List<String> get availableTimesForSelectedDate =>
      slots.firstWhere(
            (s) => s.date.day == selectedDate.day &&
            s.date.month == selectedDate.month &&
            s.date.year == selectedDate.year,
        orElse: () => TimeSlotEntity(date: selectedDate, times: []),
      ).times;
}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}