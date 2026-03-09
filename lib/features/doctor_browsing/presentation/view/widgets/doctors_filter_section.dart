import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../cubit/doctors_cubit.dart';

class DoctorsFilterSection extends StatelessWidget {
  const DoctorsFilterSection({super.key});

  static const List<DoctorSpecialtyEnum?> _specialties = [
    null,
    DoctorSpecialtyEnum.general,
    DoctorSpecialtyEnum.dentist,
    DoctorSpecialtyEnum.nutrition,
    DoctorSpecialtyEnum.heart,
    DoctorSpecialtyEnum.bones,
    DoctorSpecialtyEnum.addiction,
    DoctorSpecialtyEnum.cardiologists,
    DoctorSpecialtyEnum.dermatology,
    DoctorSpecialtyEnum.ophthalmology,
    DoctorSpecialtyEnum.neurology,
    DoctorSpecialtyEnum.pediatrics,
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DoctorsCubit>();

    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: _specialties.length,
        itemBuilder: (context, index) {
          final specialty = _specialties[index];
          final isSelected = cubit.selectedSpecialty == specialty;
          final label = specialty == null
              ? AppLocalizations.of(context)!.all
              : specialty.toLocalizedString(context);

          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: FilterChip(
              selectedColor: AppColors.mainColor,
              showCheckmark: false,
              labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: isSelected ? Colors.white : AppColors.mainColor,
                fontSize: 15.sp,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
                side: BorderSide(color: AppColors.mainColor, width: 2.r),
              ),
              label: Text(label),
              selected: isSelected,
              onSelected: (_) {
                context.read<DoctorsCubit>().loadDoctors(specialty: specialty);
              },
            ),
          );
        },
      ),
    );
  }
}