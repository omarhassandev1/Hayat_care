import 'package:injectable/injectable.dart';

import '../../../../core/enums/doctor_specialty_enum.dart';
import '../../domain/entities/doctor_entity.dart';

@lazySingleton
class DoctorsMockDataSource {
  List<DoctorEntity> getAll() => [
    DoctorEntity(
      id: '1',
      name: 'Dr. Ahmed Sami',
      specialty: DoctorSpecialtyEnum.cardiologists,
      hospital: 'Hayat Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=400',
      patientsCount: 1200,
      experienceYears: 12,
      rating: 4.8,
      reviewsCount: 4279,
      about:
          'Dr. Ahmed Sami is a highly experienced cardiologist at Hayat Hospital.',
      workingHours: 'Mon - Sat (08:30 AM - 09:00 PM)',
    ),
    DoctorEntity(
      id: '2',
      name: 'Dr. Lina Hassan',
      specialty: DoctorSpecialtyEnum.dentist,
      hospital: 'Al Noor Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=400',
      patientsCount: 950,
      experienceYears: 8,
      rating: 4.7,
      reviewsCount: 3100,
      about:
          'Dr. Lina Hassan specializes in skin conditions and cosmetic dermatology.',
      workingHours: 'Mon - Fri (09:00 AM - 05:00 PM)',
    ),
    DoctorEntity(
      id: '3',
      name: 'Dr. Omar Khaled',
      specialty: DoctorSpecialtyEnum.ophthalmology,
      hospital: 'Al Shifa Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=400',
      patientsCount: 1100,
      experienceYears: 15,
      rating: 4.9,
      reviewsCount: 5200,
      about:
          'Dr. Omar Khaled is a leading orthopedic surgeon with over 15 years of experience.',
      workingHours: 'Sun - Thu (08:00 AM - 04:00 PM)',
    ),
    DoctorEntity(
      id: '4',
      name: 'Dr. Nour Farouk',
      specialty: DoctorSpecialtyEnum.neurology,
      hospital: 'Prime Care Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400',
      patientsCount: 780,
      experienceYears: 10,
      rating: 4.6,
      reviewsCount: 2800,
      about:
          'Dr. Nour Farouk is a neurologist specializing in headache disorders and epilepsy.',
      workingHours: 'Mon - Fri (10:00 AM - 06:00 PM)',
    ),
    DoctorEntity(
      id: '5',
      name: 'Dr. Ahmed Ali',
      specialty: DoctorSpecialtyEnum.cardiologists,
      hospital: 'Future Health Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1537368910025-700350fe46c7?w=400',
      patientsCount: 2000,
      experienceYears: 18,
      rating: 4.9,
      reviewsCount: 6100,
      about:
          'Dr. Ahmed Ali is a beloved pediatrician known for his gentle approach with children.',
      workingHours: 'Sat - Thu (09:00 AM - 07:00 PM)',
    ),
    DoctorEntity(
      id: '6',
      name: 'Dr. Sara Mostafa',
      specialty: DoctorSpecialtyEnum.general,
      hospital: 'Hayat Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1527613426441-4da17471b66d?w=400',
      patientsCount: 1500,
      experienceYears: 9,
      rating: 4.5,
      reviewsCount: 3900,
      about:
          'Dr. Sara Mostafa provides comprehensive general practice and preventive care.',
      workingHours: 'Mon - Sat (08:00 AM - 08:00 PM)',
    ),
    DoctorEntity(
      id: '7',
      name: 'Dr. Karim Nabil',
      specialty: DoctorSpecialtyEnum.dentist,
      hospital: 'Smile Care Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?w=400',
      patientsCount: 870,
      experienceYears: 6,
      rating: 4.7,
      reviewsCount: 2100,
      about:
          'Dr. Karim Nabil offers a full range of dental services including cosmetic dentistry.',
      workingHours: 'Sun - Thu (10:00 AM - 08:00 PM)',
    ),
    DoctorEntity(
      id: '8',
      name: 'Dr. Mona Adel',
      specialty: DoctorSpecialtyEnum.nutrition,
      hospital: 'Wellness Center',
      imageUrl:
          'https://images.unsplash.com/photo-1651008376811-b90baee60c1f?w=400',
      patientsCount: 600,
      experienceYears: 5,
      rating: 4.6,
      reviewsCount: 1500,
      about:
          'Dr. Mona Adel helps patients achieve health goals through personalized diet plans.',
      workingHours: 'Mon - Fri (11:00 AM - 05:00 PM)',
    ),
    DoctorEntity(
      id: '9',
      name: 'Dr. Youssef Tarek',
      specialty: DoctorSpecialtyEnum.neurology,
      hospital: 'Brain & Spine Institute',
      imageUrl:
          'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=400',
      patientsCount: 430,
      experienceYears: 11,
      rating: 4.8,
      reviewsCount: 1900,
      about:
          'Dr. Youssef Tarek is a neurosurgeon with expertise in minimally invasive procedures.',
      workingHours: 'Sun - Wed (08:00 AM - 03:00 PM)',
    ),
    DoctorEntity(
      id: '10',
      name: 'Dr. Dina Sameh',
      specialty: DoctorSpecialtyEnum.heart,
      hospital: 'Cardiac Care Center',
      imageUrl:
          'https://images.unsplash.com/photo-1638202993928-7267aad84c31?w=400',
      patientsCount: 990,
      experienceYears: 14,
      rating: 4.9,
      reviewsCount: 4800,
      about:
          'Dr. Dina Sameh is an interventional cardiologist specializing in heart failure.',
      workingHours: 'Mon - Thu (07:30 AM - 03:30 PM)',
    ),
    DoctorEntity(
      id: '11',
      name: 'Dr. Hassan Fathy',
      specialty: DoctorSpecialtyEnum.bones,
      hospital: 'Al Shifa Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400',
      patientsCount: 760,
      experienceYears: 13,
      rating: 4.7,
      reviewsCount: 3300,
      about:
          'Dr. Hassan Fathy specializes in bone density disorders and fracture management.',
      workingHours: 'Sat - Wed (09:00 AM - 05:00 PM)',
    ),
    DoctorEntity(
      id: '12',
      name: 'Dr. Rania Ibrahim',
      specialty: DoctorSpecialtyEnum.general,
      hospital: 'Al Noor Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1643297654416-05795d62e39c?w=400',
      patientsCount: 1300,
      experienceYears: 7,
      rating: 4.5,
      reviewsCount: 2700,
      about:
          'Dr. Rania Ibrahim provides family medicine with focus on chronic disease management.',
      workingHours: 'Mon - Fri (08:00 AM - 04:00 PM)',
    ),
    DoctorEntity(
      id: '13',
      name: 'Dr. Khaled Mansour',
      specialty: DoctorSpecialtyEnum.dentist,
      hospital: 'Hayat Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?w=400',
      patientsCount: 540,
      experienceYears: 4,
      rating: 4.4,
      reviewsCount: 980,
      about:
          'Dr. Khaled Mansour focuses on restorative dentistry and dental implants.',
      workingHours: 'Sun - Thu (01:00 PM - 09:00 PM)',
    ),
    DoctorEntity(
      id: '14',
      name: 'Dr. Amira Zaki',
      specialty: DoctorSpecialtyEnum.ophthalmology,
      hospital: 'Vision Plus Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?w=400',
      patientsCount: 820,
      experienceYears: 9,
      rating: 4.8,
      reviewsCount: 3600,
      about:
          'Dr. Amira Zaki specializes in LASIK surgery, cataract removal, and retinal disorders.',
      workingHours: 'Mon - Sat (10:00 AM - 06:00 PM)',
    ),
    DoctorEntity(
      id: '15',
      name: 'Dr. Tarek Essam',
      specialty: DoctorSpecialtyEnum.addiction,
      hospital: 'New Life Center',
      imageUrl:
          'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=400',
      patientsCount: 350,
      experienceYears: 16,
      rating: 4.9,
      reviewsCount: 1200,
      about:
          'Dr. Tarek Essam is a psychiatrist and addiction specialist with extensive experience.',
      workingHours: 'Sun - Thu (09:00 AM - 05:00 PM)',
    ),
    DoctorEntity(
      id: '16',
      name: 'Dr. Heba Salah',
      specialty: DoctorSpecialtyEnum.nutrition,
      hospital: 'Prime Care Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1666214280557-f1b5022eb634?w=400',
      patientsCount: 490,
      experienceYears: 6,
      rating: 4.6,
      reviewsCount: 1700,
      about:
          'Dr. Heba Salah helps patients manage weight and metabolic disorders.',
      workingHours: 'Mon - Wed (12:00 PM - 07:00 PM)',
    ),
    DoctorEntity(
      id: '17',
      name: 'Dr. Mahmoud Fawzi',
      specialty: DoctorSpecialtyEnum.cardiologists,
      hospital: 'Cardiac Care Center',
      imageUrl:
          'https://images.unsplash.com/photo-1612531386530-97286d97c2d2?w=400',
      patientsCount: 1050,
      experienceYears: 20,
      rating: 5.0,
      reviewsCount: 7200,
      about:
          'Dr. Mahmoud Fawzi is a veteran cardiologist with 20 years of experience.',
      workingHours: 'Mon - Thu (07:00 AM - 02:00 PM)',
    ),
    DoctorEntity(
      id: '18',
      name: 'Dr. Yasmine Galal',
      specialty: DoctorSpecialtyEnum.addiction,
      hospital: 'Glow Skin Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400',
      patientsCount: 710,
      experienceYears: 7,
      rating: 4.7,
      reviewsCount: 2400,
      about:
          'Dr. Yasmine Galal specializes in acne treatment and anti-aging procedures.',
      workingHours: 'Sat - Wed (11:00 AM - 07:00 PM)',
    ),
    DoctorEntity(
      id: '19',
      name: 'Dr. Sherif Anwar',
      specialty: DoctorSpecialtyEnum.ophthalmology,
      hospital: 'Future Health Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1623854767648-e7bb8009f0db?w=400',
      patientsCount: 880,
      experienceYears: 11,
      rating: 4.6,
      reviewsCount: 3000,
      about:
          'Dr. Sherif Anwar specializes in knee and shoulder surgeries and sports medicine.',
      workingHours: 'Sun - Thu (08:30 AM - 04:30 PM)',
    ),
    DoctorEntity(
      id: '20',
      name: 'Dr. Noha Magdy',
      specialty: DoctorSpecialtyEnum.bones,
      hospital: 'Hayat Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1651008376811-b90baee60c1f?w=400',
      patientsCount: 1800,
      experienceYears: 14,
      rating: 4.9,
      reviewsCount: 5500,
      about:
          'Dr. Noha Magdy is a dedicated pediatrician known for her warm approach.',
      workingHours: 'Mon - Sat (09:00 AM - 06:00 PM)',
    ),
  ];
}
