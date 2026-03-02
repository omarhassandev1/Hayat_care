import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/features/appointments/presentation/view/screens/review_payment_summary_screen.dart';
import 'package:hayat_care/features/doctor_browsing/domain/entities/doctor_entity.dart';
import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'add_new_card_screen.dart';

enum _PaymentMethod { paypal, applePay, visa }

class PaymentScreen extends StatefulWidget {
  final DoctorEntity doctor;
  final DateTime selectedDate;
  final String selectedTime;
  final String patientName;
  final String ageRange;
  final Gender gender;
  final String problem;

  const PaymentScreen({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
    required this.patientName,
    required this.ageRange,
    required this.gender,
    required this.problem,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  _PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: Theme.of(context).textTheme.labelMedium),
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
                    local.selectPaymentMethod,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(height: 24.h),

                  _PaymentOptionTile(
                    isDark: isDark,
                    value: _PaymentMethod.paypal,
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() => _selectedMethod = value);
                    },
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg',
                    label: 'Paypal',
                  ),
                  SizedBox(height: 12.h),

                  _PaymentOptionTile(
                    isDark: isDark,
                    value: _PaymentMethod.applePay,
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() => _selectedMethod = value);
                    },
                    leading: Icon(Icons.apple, size: 28.r),
                    label: 'Apple Pay',
                  ),
                  SizedBox(height: 12.h),

                  _PaymentOptionTile(
                    isDark: isDark,
                    value: _PaymentMethod.visa,
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() => _selectedMethod = value);
                    },
                    leading: Container(
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
                    label: '.... .... .... 2311',
                  ),
                  SizedBox(height: 16.h),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddNewCardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkCardColor
                            : Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          local.addNewCard,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                color: AppColors.mainColor,
                                fontSize: 15.sp,
                              ),
                        ),
                      ),
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
                  _selectedMethod == null
                      ? CustomMainButton(
                          label: local.next,
                          fillColor: AppColors.mainColor.withValues(alpha: .40),
                        )
                      : CustomMainButton(
                          label: local.next,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ReviewSummaryScreen(
                                  doctor: widget.doctor,
                                  selectedDate: widget.selectedDate,
                                  selectedTime: widget.selectedTime,
                                  patientName: widget.patientName,
                                  ageRange: widget.ageRange,
                                  gender: widget.gender,
                                  problem: widget.problem,
                                  paymentMethod: _selectedMethod!.name,
                                ),
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
}

class _PaymentOptionTile extends StatelessWidget {
  final bool isDark;
  final _PaymentMethod value;
  final _PaymentMethod? groupValue;
  final ValueChanged<_PaymentMethod?> onChanged;
  final String label;
  final String? imageUrl;
  final Widget? leading;

  const _PaymentOptionTile({
    required this.isDark,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.imageUrl,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCardColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.mainColor : AppColors.lightGreyColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            _buildLeading(),

            SizedBox(width: 12.w),

            Expanded(
              child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ),

            RadioGroup<_PaymentMethod>(
              groupValue: groupValue,
              onChanged: onChanged,
              child: Radio<_PaymentMethod>(
                value: value,
                activeColor: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeading() {
    if (leading != null) return leading!;

    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        height: 26.h,
        width: 26.w,
        fit: BoxFit.contain,
        placeholder: (_, __) => const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (_, __, ___) => const Icon(Icons.payment),
      );
    }

    return const Icon(Icons.payment);
  }
}
