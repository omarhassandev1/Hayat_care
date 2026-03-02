import 'package:injectable/injectable.dart';
import '../../domain/entities/time_slot_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import '../data_sources/booking_mock_date_source.dart';

@LazySingleton(as: BookingRepository)
class BookingRepositoryImpl implements BookingRepository {
  final BookingMockDataSource _dataSource;

  BookingRepositoryImpl(this._dataSource);

  @override
  List<TimeSlotEntity> getAvailableSlots(String doctorId) {
    return _dataSource.getAvailableSlots(doctorId);
  }
}