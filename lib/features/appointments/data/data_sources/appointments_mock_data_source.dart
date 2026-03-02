import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/appointment_entity.dart';

@lazySingleton
class AppointmentsMockDataSource {
  List<AppointmentEntity> getAll() => [
    AppointmentEntity(
      id: '1',
      doctorId: '1',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 22, 16, 0),
      status: AppointmentStatusEnum.upcoming,
    ),
    AppointmentEntity(
      id: '2',
      doctorId: '2',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 23, 10, 30),
      status: AppointmentStatusEnum.upcoming,
    ),
    AppointmentEntity(
      id: '3',
      doctorId: '3',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 20, 9, 0),
      status: AppointmentStatusEnum.completed,
    ),
    AppointmentEntity(
      id: '4',
      doctorId: '4',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 18, 14, 0),
      status: AppointmentStatusEnum.completed,
    ),
    AppointmentEntity(
      id: '5',
      doctorId: '5',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 15, 11, 0),
      status: AppointmentStatusEnum.completed,
    ),
    AppointmentEntity(
      id: '6',
      doctorId: '6',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 10, 16, 0),
      status: AppointmentStatusEnum.cancelled,
    ),
    AppointmentEntity(
      id: '7',
      doctorId: '7',
      patientId: 'p1',
      dateTime: DateTime(2025, 12, 8, 13, 0),
      status: AppointmentStatusEnum.cancelled,
    ),
    AppointmentEntity(
      id: '8',
      doctorId: '1',
      patientId: 'p1',
      dateTime: DateTime(2026, 1, 5, 9, 30),
      status: AppointmentStatusEnum.upcoming,
    ),
    AppointmentEntity(
      id: '9',
      doctorId: '3',
      patientId: 'p1',
      dateTime: DateTime(2025, 11, 28, 15, 0),
      status: AppointmentStatusEnum.completed,
    ),
    AppointmentEntity(
      id: '10',
      doctorId: '8',
      patientId: 'p1',
      dateTime: DateTime(2025, 11, 20, 10, 0),
      status: AppointmentStatusEnum.cancelled,
    ),
  ];
}