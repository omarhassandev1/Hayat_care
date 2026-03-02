import 'package:hayat_care/features/appointments/domain/entities/appointment_entity.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';

class AppointmentWithDoctorEntity {
  final AppointmentEntity appointment;
  final DoctorEntity doctor;

  const AppointmentWithDoctorEntity({
    required this.appointment,
    required this.doctor,
  });
}