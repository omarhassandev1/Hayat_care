
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';

class DoctorEntity {
  final String id;
  final String name;
  final DoctorSpecialtyEnum specialty;
  final String hospital;
  final String imageUrl;
  final int patientsCount;
  final int experienceYears;
  final double rating;
  final int reviewsCount;
  final String about;
  final String workingHours;

  const DoctorEntity({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.imageUrl,
    required this.patientsCount,
    required this.experienceYears,
    required this.rating,
    required this.reviewsCount,
    required this.about,
    required this.workingHours,
  });
}