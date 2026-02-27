import 'package:hayat_care/features/doctor_browsing/data/data_source/doctors_mock_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enums/doctor_specialty_enum.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/repositories/doctors_repository.dart';

@LazySingleton(as: DoctorsRepository)
class DoctorsRepositoryImpl implements DoctorsRepository {
  final DoctorsMockDataSource _dataSource;

  DoctorsRepositoryImpl(this._dataSource);

  @override
  List<DoctorEntity> getAllDoctors() => _dataSource.getAll();

  @override
  List<DoctorEntity> searchDoctors({
    String? query,
    DoctorSpecialtyEnum? specialty,
  }) {
    var doctors = _dataSource.getAll();

    if (specialty != null) {
      doctors = doctors
          .where((d) => d.specialty == specialty)
          .toList();
    }

    if (query != null && query.isNotEmpty) {
      doctors = doctors
          .where((d) => d.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return doctors;
  }
}