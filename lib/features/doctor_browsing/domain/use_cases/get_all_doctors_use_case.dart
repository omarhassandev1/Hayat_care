import 'package:hayat_care/features/doctor_browsing/domain/repositories/doctors_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/doctor_entity.dart';

@lazySingleton
class GetAllDoctorsUseCase {
  final DoctorsRepository doctorsRepository;

  GetAllDoctorsUseCase({required this.doctorsRepository});
  
  List<DoctorEntity> call() => doctorsRepository.getAllDoctors();
}