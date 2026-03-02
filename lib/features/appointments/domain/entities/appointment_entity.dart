import 'package:hayat_care/core/enums/appointment_status_enum.dart';

class AppointmentEntity {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime dateTime;
  final AppointmentStatusEnum status;

  const AppointmentEntity({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.dateTime,
    required this.status,
  });
}