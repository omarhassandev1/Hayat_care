import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import '../entities/doctor_entity.dart';

abstract class DoctorsRepository {
  List<DoctorEntity> getAllDoctors();
  List<DoctorEntity> searchDoctors({
    String? query,
    DoctorSpecialtyEnum? specialty,
  });
}