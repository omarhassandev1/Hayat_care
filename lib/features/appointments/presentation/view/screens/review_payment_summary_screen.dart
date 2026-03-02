import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/success_dialog.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:hayat_care/features/layout/presentation/view/main_layout_view.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../../gen/assets.gen.dart';

class ReviewSummaryScreen extends StatelessWidget {
  final DoctorEntity doctor;
  final DateTime selectedDate;
  final String selectedTime;
  final String patientName;
  final String ageRange;
  final Gender gender;
  final String problem;
  final String paymentMethod;

  const ReviewSummaryScreen({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
    required this.patientName,
    required this.ageRange,
    required this.gender,
    required this.problem,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.reviewSummary,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                children: [
                  _buildCard(
                    isDark: isDark,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(
                            imageUrl: doctor.imageUrl,
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) => Container(
                              width: 100.w,
                              height: 100.h,
                              color: AppColors.lightGreyColor,
                              child: Assets.profile.personErrorView.svg(
                                colorFilter: ColorFilter.mode(
                                  AppColors.mainColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              SizedBox(height: 6.h),
                              Divider(thickness: 2),
                              SizedBox(height: 6.h),
                              Text(
                                '${doctor.specialty.toLocalizedString(context)}  |  ${doctor.hospital}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border_rounded,
                                    color: Colors.blue,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${doctor.rating} (${doctor.reviewsCount} ${local.reviews})',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildCard(
                    isDark: isDark,
                    child: Column(
                      children: [
                        _buildRow(
                          context,
                          label: local.dateAndHour,
                          value:
                              '${DateFormat('MMM dd, yyyy').format(selectedDate)}  |  $selectedTime',
                        ),
                        _buildDivider(),
                        _buildRow(
                          context,
                          label: local.package,
                          value: local.medicalConsultation,
                        ),
                        _buildDivider(),
                        _buildRow(
                          context,
                          label: local.package,
                          value: local.normal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildCard(
                    isDark: isDark,
                    child: Column(
                      children: [
                        _buildRow(
                          context,
                          label: local.amount,
                          value: '200 Egp',
                        ),
                        _buildDivider(),
                        _buildRow(
                          context,
                          label: local.package,
                          value: local.medicalConsultation,
                        ),
                        _buildDivider(),
                        _buildRow(
                          context,
                          label: local.total,
                          value: '200 Egp',
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildCard(
                    isDark: isDark,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'VISA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '.... .... .... 2311',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            local.change,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: AppColors.mainColor,
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
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
                  CustomMainButton(
                    label: local.confirm_button,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => SuccessDialog(
                          title: local.bookingConfirmedTitle,
                          subtitle: local.bookingConfirmedSubtitle,
                          primaryButtonText: local.goToAppointments,
                          onPrimaryPressed: () {
                            context.read<LayoutCubit>().changeBottomNav(1);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainLayoutView(),
                              ),
                              (route) => false,
                            );
                          },
                          secondaryButtonText: local.cancelBooking,
                          onSecondaryPressed: () => Navigator.pop(context),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required bool isDark, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String label,
    required String value,
    bool isTotal = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(thickness: 1, height: 1);
  }
}
