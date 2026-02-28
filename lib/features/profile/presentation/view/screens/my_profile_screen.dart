import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../../core/enums/gender_enum.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../domain/entities/user_entity.dart';
import '../../cubit/profile_state.dart';
import '../widgets/gender_bottom_sheet.dart';

class MyProfileScreen extends StatefulWidget {
  final UserEntity currentUser;

  const MyProfileScreen({super.key, required this.currentUser});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController birthDateController;
  late TextEditingController genderController;
  late TextEditingController emergencyController;
  late TextEditingController idController;
  late Gender gender;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentUser.name);
    phoneController = TextEditingController(
      text: widget.currentUser.phoneNumber,
    );
    birthDateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(widget.currentUser.dateOfBirth),
    );
    genderController = TextEditingController(
      text: widget.currentUser.gender.name,
    );
    emergencyController = TextEditingController(
      text: widget.currentUser.emergencyNumber ?? "",
    );
    idController = TextEditingController(text: widget.currentUser.nationalId);
    gender = widget.currentUser.gender;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    emergencyController.dispose();
    idController.dispose();
    super.dispose();
  }

  Gender? selectedGenderValue;
  DateTime? selectedBirthDate;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          Navigator.pop(context);
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.redColor,
              padding: EdgeInsets.all(8.r),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              local.profile,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.mainColor,
                              width: 2,
                            ),
                          ),
                          child: widget.currentUser.imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(120.r),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.currentUser.imageUrl!,
                                    errorWidget: (context, url, error) =>
                                        Assets.profile.personErrorView.svg(
                                          colorFilter: ColorFilter.mode(
                                            AppColors.mainColor,
                                            BlendMode.srcIn,
                                          ),
                                          height: 60.h,
                                          width: 60.h,
                                        ),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Assets.profile.personErrorView.svg(
                                  colorFilter: ColorFilter.mode(
                                    AppColors.mainColor,
                                    BlendMode.srcIn,
                                  ),
                                  height: 60.h,
                                  width: 60.h,
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.darkGreyColor
                                  : AppColors.lightGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit_outlined, size: 20.sp),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  CustomTextField(
                    labelText: local.fullName,
                    controller: nameController,
                    hintText: local.fullNameHint,
                  ),
                  SizedBox(height: 15.h),

                  CustomTextField(
                    labelText: local.mobileNumber,
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                    hintText: "010XXXXXXXX",
                  ),
                  SizedBox(height: 15.h),

                  CustomTextField(
                    readOnly: true,
                    labelText: local.dateOfBirth,
                    controller: birthDateController,
                    hintText: "DD/MM/YYYY",
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
                  SizedBox(height: 15.h),

                  CustomTextField(
                    readOnly: true,
                    labelText: local.gender,
                    controller: genderController,
                    hintText: "${local.male} / ${local.female}",
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
                          genderController.text = (pickedGender == Gender.male)
                              ? local.male
                              : local.female;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 15.h),

                  CustomTextField(
                    labelText: local.emergencyNoLabel,
                    controller: emergencyController,
                    textInputType: TextInputType.phone,
                    hintText: "010XXXXXXXX",
                  ),
                  SizedBox(height: 15.h),

                  CustomTextField(
                    labelText: local.nationalId,
                    controller: idController,
                    textInputType: TextInputType.number,
                    hintText: local.nationalIdHint,
                  ),

                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      state is ProfileUpdating
                          ? CustomMainButton(
                              label: local.updating,
                              fillColor: AppColors.mainColor.withValues(
                                alpha: .3,
                              ),
                            )
                          : CustomMainButton(
                              label: local.updateInfo,
                              onPressed: () {
                                final updatedUser = UserEntity(
                                  name: nameController.text.trim(),
                                  nationalId: idController.text.trim(),
                                  email: widget.currentUser.email,
                                  phoneNumber: phoneController.text.trim(),
                                  gender:
                                      selectedGenderValue ??
                                      widget.currentUser.gender,
                                  dateOfBirth:
                                      selectedBirthDate ??
                                      widget.currentUser.dateOfBirth,
                                  imageUrl: widget.currentUser.imageUrl,
                                  emergencyNumber:
                                      emergencyController.text.trim().isNotEmpty
                                      ? emergencyController.text.trim()
                                      : null,
                                );
                                context.read<ProfileCubit>().updateProfile(
                                  updatedUser,
                                );
                              },
                            ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
