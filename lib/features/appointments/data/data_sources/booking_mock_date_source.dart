import 'package:injectable/injectable.dart';
import '../../domain/entities/time_slot_entity.dart';

@lazySingleton
class BookingMockDataSource {
  List<TimeSlotEntity> getAvailableSlots(String doctorId) => [
    TimeSlotEntity(
      date: DateTime(2026, 1, 10),
      times: ['09:00 AM', '09:30 AM', '10:00 AM', '12:00 PM', '12:30 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 11),
      times: ['09:00 AM', '10:00 AM', '01:30 PM', '03:00 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 12),
      times: ['12:00 PM', '12:30 PM', '04:30 PM', '05:00 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 13),
      times: ['09:30 AM', '10:00 AM', '03:00 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 14),
      times: ['09:00 AM', '12:30 PM', '01:30 PM', '04:30 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 15),
      times: ['09:00 AM', '09:30 AM', '05:00 PM'],
    ),
    TimeSlotEntity(
      date: DateTime(2026, 1, 16),
      times: ['10:00 AM', '12:00 PM', '03:00 PM', '04:30 PM'],
    ),
  ];
}