import 'package:injectable/injectable.dart';
import '../entities/time_slot_entity.dart';
import '../repositories/booking_repository.dart';

@injectable
class GetAvailableSlotsUseCase {
  final BookingRepository repository;

  GetAvailableSlotsUseCase(this.repository);

  List<TimeSlotEntity> call(String doctorId) {
    return repository.getAvailableSlots(doctorId);
  }
}