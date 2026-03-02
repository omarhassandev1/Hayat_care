import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/payment_screen.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class PatientBookingDetailsScreen extends StatefulWidget {
  final DoctorEntity doctor;
  final DateTime selectedDate;
  final String selectedTime;

  const PatientBookingDetailsScreen({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<PatientBookingDetailsScreen> createState() =>
      _PatientBookingDetailsScreenState();
}

class _PatientBookingDetailsScreenState
    extends State<PatientBookingDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  String? _selectedAgeRange;
  Gender _selectedGender = Gender.male;

  final List<String> _ageRanges = [
    '1 - 10',
    '11 - 17',
    '18 - 25',
    '26 - 30',
    '31 - 40',
    '41 - 50',
    '51 - 60',
    '60+',
  ];

  @override
  void initState() {
    super.initState();
    final profileState = context.read<ProfileCubit>().state;
    if (profileState is ProfileLoaded) {
      _nameController.text = profileState.user.name;
      _selectedGender = profileState.user.gender;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _problemController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _nameController.text.isNotEmpty && _selectedAgeRange != null;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.bookAppointment,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local.patientDetails,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(height: 24.h),
                  _FieldLabel(label: local.fullName),
                  SizedBox(height: 8.h),
                  _BookingTextField(
                    controller: _nameController,
                    hint: local.fullNameHint,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 20.h),
                  _FieldLabel(label: local.age),
                  SizedBox(height: 8.h),
                  _AgeDropdown(
                    selectedAgeRange: _selectedAgeRange,
                    ageRanges: _ageRanges,
                    hint: local.selectAgeRange,
                    onChanged: (value) =>
                        setState(() => _selectedAgeRange = value),
                  ),
                  SizedBox(height: 20.h),
                  _FieldLabel(label: local.gender),
                  SizedBox(height: 8.h),
                  _GenderToggle(
                    selectedGender: _selectedGender,
                    maleLabel: local.male,
                    femaleLabel: local.female,
                    onChanged: (gender) =>
                        setState(() => _selectedGender = gender),
                  ),
                  SizedBox(height: 20.h),
                  _FieldLabel(label: local.writeYourProblem),
                  SizedBox(height: 8.h),
                  _BookingTextField(
                    controller: _problemController,
                    hint: local.writeYourProblem,
                    maxLines: 5,
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 24.h,
              top: 8.h,
            ),
            child: SizedBox(
              height: 57.h,
              child: Row(
                children: [
                  !_isValid
                      ? CustomMainButton(
                          label: local.next,
                          fillColor: AppColors.mainColor.withValues(alpha: .40),
                        )
                      : CustomMainButton(
                          label: local.next,
                          onPressed: _isValid
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PaymentScreen(
                                        doctor: widget.doctor,
                                        selectedDate: widget.selectedDate,
                                        selectedTime: widget.selectedTime,
                                        patientName: _nameController.text,
                                        ageRange: _selectedAgeRange!,
                                        gender: _selectedGender,
                                        problem: _problemController.text,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: AppColors.mainColor,
        fontSize: 14.sp,
      ),
    );
  }
}

class _BookingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final ValueChanged<String> onChanged;

  const _BookingTextField({
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: isDark ? AppColors.darkCardColor : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}

class _AgeDropdown extends StatelessWidget {
  final String? selectedAgeRange;
  final List<String> ageRanges;
  final String hint;
  final ValueChanged<String?> onChanged;

  const _AgeDropdown({
    required this.selectedAgeRange,
    required this.ageRanges,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedAgeRange,
          isExpanded: true,
          hint: Text(
            hint,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
          items: ageRanges
              .map(
                (range) => DropdownMenuItem(
                  value: range,
                  child: Text(
                    range,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _GenderToggle extends StatelessWidget {
  final Gender selectedGender;
  final String maleLabel;
  final String femaleLabel;
  final ValueChanged<Gender> onChanged;

  const _GenderToggle({
    required this.selectedGender,
    required this.maleLabel,
    required this.femaleLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GenderButton(
          label: maleLabel,
          isSelected: selectedGender == Gender.male,
          onTap: () => onChanged(Gender.male),
        ),
        SizedBox(width: 12.w),
        _GenderButton(
          label: femaleLabel,
          isSelected: selectedGender == Gender.female,
          onTap: () => onChanged(Gender.female),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.mainColor : AppColors.lightGreyColor,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
