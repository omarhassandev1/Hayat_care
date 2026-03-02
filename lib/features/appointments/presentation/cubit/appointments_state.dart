import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/core/enums/appointment_status_enum.dart';

abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsLoadSuccess extends AppointmentsState {
  final List<AppointmentWithDoctorEntity> appointments;
  final AppointmentStatusEnum selectedStatus;

  AppointmentsLoadSuccess({
    required this.appointments,
    required this.selectedStatus,
  });
}

class AppointmentsEmpty extends AppointmentsState {
  final AppointmentStatusEnum selectedStatus;
  AppointmentsEmpty({required this.selectedStatus});
}

class AppointmentsError extends AppointmentsState {
  final String message;
  AppointmentsError(this.message);
}