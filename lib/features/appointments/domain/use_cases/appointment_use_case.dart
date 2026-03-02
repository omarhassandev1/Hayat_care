import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/domain/repositories/appointment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAppointmentsByStatusUseCase {
  final AppointmentsRepository repository;

  GetAppointmentsByStatusUseCase(this.repository);

  List<AppointmentWithDoctorEntity> call(AppointmentStatusEnum status) =>
      repository.getAppointmentsByStatus(status);
}
