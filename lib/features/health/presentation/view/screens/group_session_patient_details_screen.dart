import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/support_group_type_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_snackbar.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:hayat_care/core/widgets/success_dialog.dart';
import 'package:hayat_care/features/health/domain/entities/group_session_request_entity.dart';
import 'package:hayat_care/features/health/presentation/cubits/health_cubit/health_cubit.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class GroupSessionPatientDetailsScreen extends StatefulWidget {
  const GroupSessionPatientDetailsScreen({super.key});

  @override
  State<GroupSessionPatientDetailsScreen> createState() =>
      _GroupSessionPatientDetailsScreenState();
}

class _GroupSessionPatientDetailsScreenState
    extends State<GroupSessionPatientDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String? _selectedAgeRange;
  String? _selectedGender;
  SupportGroupTypeEnum? _selectedGroupType;

  final List<String> _ageRanges = [
    '18 - 25',
    '26 - 35',
    '36 - 45',
    '46 - 60',
    '60+',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(locale.groupSessions)),
      body: BlocListener<HealthCubit, HealthState>(
        listener: (context, state) {
          if (state is JoinGroupSuccess) {
            _showSuccessDialog(context);
          } else if (state is HealthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                Text(
                  locale.patientDetails,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                CustomTextField(
                  controller: _fullNameController,
                  labelText: locale.fullName,
                  hintText: locale.fullNameHint,
                  validator: (value) => value == null || value.isEmpty
                      ? locale.fieldRequired
                      : null,
                ),
                _AgeRangeDropdown(
                  ageRanges: _ageRanges,
                  selectedAgeRange: _selectedAgeRange,
                  onChanged: (value) =>
                      setState(() => _selectedAgeRange = value),
                ),
                _GenderToggle(
                  selectedGender: _selectedGender,
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                CustomTextField(
                  controller: _phoneController,
                  labelText: locale.phoneNumber,
                  hintText: locale.phoneNumberHint,
                  textInputType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? locale.fieldRequired
                      : null,
                ),
                CustomTextField(
                  controller: _addressController,
                  labelText: locale.address,
                  hintText: locale.address,
                  validator: (value) => value == null || value.isEmpty
                      ? locale.fieldRequired
                      : null,
                ),
                _SupportGroupTypeDropdown(
                  selectedType: _selectedGroupType,
                  onChanged: (value) =>
                      setState(() => _selectedGroupType = value),
                ),
                SizedBox(height: 8.h),
                BlocBuilder<HealthCubit, HealthState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CustomMainButton(
                          onPressed: _onConfirm,
                          label: locale.confirm,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onConfirm() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedAgeRange == null ||
        _selectedGender == null ||
        _selectedGroupType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          padding: EdgeInsets.zero,
          content: CustomSnackBar(
            message: AppLocalizations.of(context)!.pleaseFillAllFields,
            type: SnackBarType.error,
          ),
        ),
      );
      return;
    }

    context.read<HealthCubit>().joinSupportGroup(
      GroupSessionRequestEntity(
        fullName: _fullNameController.text.trim(),
        ageRange: _selectedAgeRange!,
        gender: _selectedGender!,
        phoneNumber: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        groupType: _selectedGroupType!,
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SuccessDialog(
        title: AppLocalizations.of(context)!.groupSessionConfirmed,
        subtitle: AppLocalizations.of(context)!.groupSessionConfirmedSubtitle,
        onPrimaryPressed: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        primaryButtonText: AppLocalizations.of(context)!.confirm,
      ),
    );
  }
}

class _AgeRangeDropdown extends StatelessWidget {
  const _AgeRangeDropdown({
    required this.ageRanges,
    required this.selectedAgeRange,
    required this.onChanged,
  });

  final List<String> ageRanges;
  final String? selectedAgeRange;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkCardColor
            : AppColors.lightTextFieldFillColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedAgeRange,
          isExpanded: true,
          hint: Text(
            l10n.selectAgeRange,
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
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
  const _GenderToggle({required this.selectedGender, required this.onChanged});

  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        _GenderButton(
          label: l10n.male,
          isSelected: selectedGender == 'male',
          onTap: () => onChanged('male'),
        ),
        SizedBox(width: 12.w),
        _GenderButton(
          label: l10n.female,
          isSelected: selectedGender == 'female',
          onTap: () => onChanged('female'),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainColor
              : isDark
              ? AppColors.darkCardColor
              : AppColors.lightTextFieldFillColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: isSelected ? Colors.white : isDark? AppColors.lightGreyColor : AppColors.blueishGreyColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

class _SupportGroupTypeDropdown extends StatelessWidget {
  const _SupportGroupTypeDropdown({
    required this.selectedType,
    required this.onChanged,
  });

  final SupportGroupTypeEnum? selectedType;
  final ValueChanged<SupportGroupTypeEnum?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkCardColor
            : AppColors.lightTextFieldFillColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<SupportGroupTypeEnum>(
          value: selectedType,
          isExpanded: true,
          hint: Text(
            l10n.supportGroupType,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
          items: SupportGroupTypeEnum.values
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(
                    type.toLocalizedString(context),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(fontSize: 14.sp),
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
