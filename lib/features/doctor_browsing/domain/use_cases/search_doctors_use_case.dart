import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:injectable/injectable.dart';
import '../entities/doctor_entity.dart';
import '../repositories/doctors_repository.dart';

@injectable
class SearchDoctorsUseCase {
  final DoctorsRepository repository;

  SearchDoctorsUseCase(this.repository);

  List<DoctorEntity> call({
    String? query,
    DoctorSpecialtyEnum? specialty,
  }) {
    return repository.searchDoctors(query: query, specialty: specialty);
  }
}