import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_available_slots_use_case.dart';
import 'booking_state.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final GetAvailableSlotsUseCase getAvailableSlotsUseCase;

  BookingCubit({required this.getAvailableSlotsUseCase})
      : super(BookingInitial());

  void loadSlots(String doctorId) {
    emit(BookingLoading());

    final slots = getAvailableSlotsUseCase.call(doctorId);

    if (slots.isEmpty) {
      emit(BookingError('No available slots'));
      return;
    }

    emit(BookingSlotsLoaded(
      slots: slots,
      selectedDate: slots.first.date,
    ));
  }

  void selectDate(DateTime date) {
    final current = state as BookingSlotsLoaded;
    emit(current.copyWith(selectedDate: date, selectedTime: null));
  }

  void selectTime(String time) {
    final current = state as BookingSlotsLoaded;
    emit(current.copyWith(selectedTime: time));
  }
}