import '../entities/time_slot_entity.dart';

abstract class BookingRepository {
  List<TimeSlotEntity> getAvailableSlots(String doctorId);
}