import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../doctor_browsing/presentation/view/widgets/basic_doctor_card.dart';

class FavoriteDoctorsScreen extends StatelessWidget {
  const FavoriteDoctorsScreen({super.key});
  static const String routeName = 'favoriteDoctorsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.myFavorites,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        actions: [
          GestureDetector(child: Icon(Icons.search, size: 30.r)),
          SizedBox(width: 16.w),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => const [
          BasicDoctorCardUpdated(
            doctor: DoctorEntity(
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
          ),
          BasicDoctorCardUpdated(
            doctor: DoctorEntity(
              id: '2',
              name: 'Dr. Lina Hassan',
              specialty: DoctorSpecialtyEnum.dermatology,
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
          ),
          BasicDoctorCardUpdated(
            doctor: DoctorEntity(
              id: '3',
              name: 'Dr. Omar Khaled',
              specialty: DoctorSpecialtyEnum.orthopedics,
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
          ),
          BasicDoctorCardUpdated(
            doctor: DoctorEntity(
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
          ),
          BasicDoctorCardUpdated(
            doctor: DoctorEntity(
              id: '5',
              name: 'Dr. Ahmed Ali',
              specialty: DoctorSpecialtyEnum.pediatrics,
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
          ),
        ][index],
      ),
    );
  }
}
