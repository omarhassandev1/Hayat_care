import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enums/doctor_specialty_enum.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../doctor_browsing/domain/entities/doctor_entity.dart';
import '../../../../doctor_browsing/presentation/view/screens/doctor_profile_screen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class HomeTopDoctorsSection extends StatelessWidget {
  const HomeTopDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopDoctorsHeader(),
        SizedBox(
          height: 190.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: 5,
            itemBuilder: (context, index) => TopDoctorsCard(),
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
          ),
        ),
      ],
    );
  }
}

class TopDoctorsCard extends StatelessWidget {
  const TopDoctorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DoctorProfileScreen(
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
          ),
        );
      },
      child: SizedBox(
        width: 213.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                imageUrl:
                    'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                height: 133.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Ahmed Sami',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Cardiologists',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopDoctorsHeader extends StatelessWidget {
  const TopDoctorsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
        top: 32.h,
      ),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.topDoctors,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Text(
              AppLocalizations.of(context)!.seeAll,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: AppColors.mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
