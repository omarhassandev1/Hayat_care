import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import '../entities/appointment_with_doctor_entity.dart';

abstract class AppointmentsRepository {
  List<AppointmentWithDoctorEntity> getAppointmentsByStatus(
    AppointmentStatusEnum status,
  );
}
