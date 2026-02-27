// doctors_state.dart

import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import '../../domain/entities/doctor_entity.dart';

abstract class DoctorsState {}

class DoctorsInitial extends DoctorsState {}

class DoctorsLoading extends DoctorsState {}

class DoctorsLoadSuccess extends DoctorsState {
  final List<DoctorEntity> doctors;
  final DoctorSpecialtyEnum? selectedSpecialty;
  final String? searchQuery;

  DoctorsLoadSuccess({
    required this.doctors,
    this.selectedSpecialty,
    this.searchQuery,
  });
}

class DoctorsEmpty extends DoctorsState {
  final DoctorSpecialtyEnum? selectedSpecialty;
  final String? searchQuery;

  DoctorsEmpty({this.selectedSpecialty, this.searchQuery});
}

class DoctorsError extends DoctorsState {
  final String message;
  DoctorsError(this.message);
}