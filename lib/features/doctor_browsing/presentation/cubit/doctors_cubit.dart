import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/features/doctor_browsing/domain/use_cases/get_all_doctors_use_case.dart';
import 'package:hayat_care/features/doctor_browsing/domain/use_cases/search_doctors_use_case.dart';
import 'package:injectable/injectable.dart';
import 'doctors_state.dart';

@injectable
class DoctorsCubit extends Cubit<DoctorsState> {
  final GetAllDoctorsUseCase getAllDoctorsUseCase;
  final SearchDoctorsUseCase searchDoctorsUseCase;

  DoctorSpecialtyEnum? _selectedSpecialty;
  String _searchQuery = '';

  DoctorsCubit({
    required this.getAllDoctorsUseCase,
    required this.searchDoctorsUseCase,
  }) : super(DoctorsInitial());

  void loadDoctors({DoctorSpecialtyEnum? specialty}) {
    _selectedSpecialty = specialty;
    _applyFilters();
  }

  void searchDoctors(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    emit(DoctorsLoading());

    final doctors = searchDoctorsUseCase.call(
      query: _searchQuery.isEmpty ? null : _searchQuery,
      specialty: _selectedSpecialty,
    );

    if (doctors.isEmpty) {
      emit(DoctorsEmpty(
        selectedSpecialty: _selectedSpecialty,
        searchQuery: _searchQuery,
      ));
    } else {
      emit(DoctorsLoadSuccess(
        doctors: doctors,
        selectedSpecialty: _selectedSpecialty,
        searchQuery: _searchQuery,
      ));
    }
  }

  DoctorSpecialtyEnum? get selectedSpecialty => _selectedSpecialty;
  String get searchQuery => _searchQuery;
}