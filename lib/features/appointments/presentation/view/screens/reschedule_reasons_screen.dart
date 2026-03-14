import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/appointments/domain/entities/appointment_with_doctor_entity.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/reschedule_appointments_screen.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class RescheduleReasonScreen extends StatefulWidget {
  final AppointmentWithDoctorEntity appointmentWithDoctor;

  const RescheduleReasonScreen({
    super.key,
    required this.appointmentWithDoctor,
  });

  @override
  State<RescheduleReasonScreen> createState() => _RescheduleReasonScreenState();
}

class _RescheduleReasonScreenState extends State<RescheduleReasonScreen> {
  int? _selectedIndex;
  final TextEditingController _otherController = TextEditingController();

  List<String> _reasons(AppLocalizations local) => [
    local.rescheduleReason1,
    local.rescheduleReason2,
    local.rescheduleReason3,
    local.rescheduleReason4,
    local.rescheduleReasonOthers,
  ];

  bool get _isOthersSelected {
    final local = AppLocalizations.of(context)!;
    return _selectedIndex == _reasons(local).length - 1;
  }

  bool get _isValid {
    if (_selectedIndex == null) return false;
    if (_isOthersSelected) return _otherController.text.isNotEmpty;
    return true;
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final local = AppLocalizations.of(context)!;
    final reasons = _reasons(local);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.reschedule,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.w700),
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
                    local.rescheduleReasonTitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(height: 24.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reasons.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedIndex == index;

                      return GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.mainColor.withValues(alpha: 0.05)
                                : isDark
                                ? AppColors.darkCardColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.mainColor
                                  : AppColors.lightGreyColor
                                  .withValues(alpha: 0.4),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  reasons[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 14.sp),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 22.r,
                                height: 22.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? AppColors.mainColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.mainColor
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Icon(
                                  Icons.check,
                                  size: 14.r,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // Others text field
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _isOthersSelected
                        ? Column(
                      children: [
                        SizedBox(height: 12.h),
                        TextField(
                          controller: _otherController,
                          maxLines: 4,
                          onChanged: (_) => setState(() {}),
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: local.enterYourMessage,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                            filled: true,
                            fillColor: isDark
                                ? AppColors.darkCardColor
                                : Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ],
                    )
                        : const SizedBox.shrink(),
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
                    label: local.next,
                    fillColor: _isValid
                        ? AppColors.mainColor
                        : AppColors.mainColor.withValues(alpha: 0.4),
                    onPressed: _isValid
                        ? () {
                      final reason = _isOthersSelected
                          ? _otherController.text
                          : reasons[_selectedIndex!];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RescheduleAppointmentScreen(
                            doctor:
                            widget.appointmentWithDoctor.doctor,
                            appointment:
                            widget.appointmentWithDoctor.appointment,
                            reason: reason,
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