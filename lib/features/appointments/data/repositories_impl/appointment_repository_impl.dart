import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/features/appointments/data/data_sources/appointments_mock_data_source.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/domain/repositories/appointment_repository.dart';
import 'package:hayat_care/features/doctor_browsing/data/data_source/doctors_mock_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppointmentsRepository)
class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final AppointmentsMockDataSource _appointmentsDataSource;
  final DoctorsMockDataSource _doctorsDataSource;

  AppointmentsRepositoryImpl(
      this._appointmentsDataSource,
      this._doctorsDataSource,
      );

  @override
  List<AppointmentWithDoctorEntity> getAppointmentsByStatus(
      AppointmentStatusEnum status,
      ) {
    final appointments = _appointmentsDataSource
        .getAll()
        .where((a) => a.status == status)
        .toList();

    final doctors = _doctorsDataSource.getAll();

    return appointments.map((appointment) {
      final doctor = doctors.firstWhere((d) => d.id == appointment.doctorId);
      return AppointmentWithDoctorEntity(
        appointment: appointment,
        doctor: doctor,
      );
    }).toList();
  }
}