// features/care/presentation/cubit/appointments_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/features/appointments/domain/use_cases/appointment_use_case.dart';
import 'package:injectable/injectable.dart';
import 'appointments_state.dart';

@injectable
class AppointmentsCubit extends Cubit<AppointmentsState> {
  final GetAppointmentsByStatusUseCase getAppointmentsByStatusUseCase;

  AppointmentsCubit({required this.getAppointmentsByStatusUseCase})
      : super(AppointmentsInitial());

  AppointmentStatusEnum _selectedStatus = AppointmentStatusEnum.upcoming;

  void loadAppointments({
    AppointmentStatusEnum status = AppointmentStatusEnum.upcoming,
  }) {
    _selectedStatus = status;
    emit(AppointmentsLoading());

    final appointments = getAppointmentsByStatusUseCase.call(status);

    if (appointments.isEmpty) {
      emit(AppointmentsEmpty(selectedStatus: _selectedStatus));
    } else {
      emit(AppointmentsLoadSuccess(
        appointments: appointments,
        selectedStatus: _selectedStatus,
      ));
    }
  }

  AppointmentStatusEnum get selectedStatus => _selectedStatus;
}