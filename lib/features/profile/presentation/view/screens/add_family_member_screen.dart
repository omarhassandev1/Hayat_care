import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:hayat_care/features/profile/domain/entities/family_member_entity.dart';
import 'package:hayat_care/features/profile/presentation/cubit/family_cubit.dart';

import '../../../../../core/enums/gender_enum.dart';
import '../../../../../localization/app_localizations.dart';
import '../widgets/gender_bottom_sheet.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  const AddFamilyMemberScreen({super.key});
  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {


  late final TextEditingController birthDateController;
  late final TextEditingController genderController;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController nationalIdController;
  late final TextEditingController relationshipController;

  @override
  void initState() {
    super.initState();
    birthDateController = TextEditingController();
    genderController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    nationalIdController = TextEditingController();
    relationshipController = TextEditingController();
  }

  @override
  void dispose() {
    birthDateController.dispose();
    genderController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    nationalIdController.dispose();
    relationshipController.dispose();
    super.dispose();
  }

  DateTime? selectedBirthDate;
  Gender? selectedGenderValue;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    Gender? selectedGenderValue;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.family,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 24.sp),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15.h,
              children: [
                CustomTextField(
                  controller: nameController,
                  labelText: local.fullName,
                  hintText: local.fullNameHint,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: local.email,
                  hintText: local.emailHint,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  labelText: local.mobileNumber,
                  hintText: local.mobileNumberHint,
                  textInputType: TextInputType.phone,
                ),
                CustomTextField(
                  controller: birthDateController,
                  labelText: local.dateOfBirth,
                  hintText: local.dateOfBirth,
                  readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedBirthDate = pickedDate;
                          birthDateController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                ),
                CustomTextField(
                  controller: genderController,
                  labelText: local.gender,
                  hintText: 'e.g, Male',
                  readOnly: true,
                  onTap: () async {
                    final Gender? pickedGender =
                    await showModalBottomSheet<Gender>(
                      context: context,
                      builder: (context) => GenderBottomSheet(
                        selectedGender: selectedGenderValue,
                      ),
                    );

                    if (pickedGender != null) {
                      setState(() {
                        selectedGenderValue = pickedGender;
                        genderController.text =
                        (pickedGender == Gender.male)
                            ? local.male
                            : local.female;
                      });
                    }
                  },
                ),
                CustomTextField(
                  controller: nationalIdController,
                  labelText: local.nationalId,
                  hintText: 'e.g, 30402368410231',
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  controller: relationshipController,
                  labelText: local.relationship,
                  hintText: 'e.g, Father',
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    CustomMainButton(
                      label: local.addFamilyMember,
                      onPressed: () {
                        if (selectedBirthDate == null) {
                          return;
                        }

                        final member = FamilyMemberEntity(
                          nationalId: nationalIdController.text.trim(),
                          name: nameController.text.trim(),
                          relationship: relationshipController.text.trim(),
                          birthDate: selectedBirthDate!,
                        );

                        context.read<FamilyCubit>().addMember(member);

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
