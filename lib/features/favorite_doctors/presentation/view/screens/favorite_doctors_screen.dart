import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            name: "Dr. Ahmed Sami",
            specialty: "Cardiologists",
            hospital: "Hayat Hospital",
            rating: "4.8",
            reviews: "4,279",
            imagePath:
                'https://i.pinimg.com/736x/f4/c9/ef/f4c9ef33d04a22050038e9e53eeb7d85.jpg',
          ),
          BasicDoctorCardUpdated(
            name: "Dr. Lina Hassan",
            specialty: "Dermatology",
            hospital: "Hayat Hospital",
            rating: "4.8",
            reviews: "4,279",
            imagePath:
                "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-with-stethoscope-around-neck-standing-with-folded-arms_409827-254.jpg",
          ),
          BasicDoctorCardUpdated(
            name: "Dr. Ahmed Sami",
            specialty: "Cardiologists",
            hospital: "Hayat Hospital",
            rating: "4.8",
            reviews: "4,279",
            imagePath:
                'https://i.pinimg.com/736x/f4/c9/ef/f4c9ef33d04a22050038e9e53eeb7d85.jpg',
          ),
          BasicDoctorCardUpdated(
            name: "Dr. Ahmed Sami",
            specialty: "Cardiologists",
            hospital: "Hayat Hospital",
            rating: "4.8",
            reviews: "4,279",
            imagePath:
            'https://i.pinimg.com/736x/f4/c9/ef/f4c9ef33d04a22050038e9e53eeb7d85.jpg',
          ),
          BasicDoctorCardUpdated(
            name: "Dr. Lina Hassan",
            specialty: "Dermatology",
            hospital: "Hayat Hospital",
            rating: "4.8",
            reviews: "4,279",
            imagePath:
            "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-with-stethoscope-around-neck-standing-with-folded-arms_409827-254.jpg",
          ),
        ][index],
      ),
    );
  }
}
