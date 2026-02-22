import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/selection_option_item.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../core/enums/gender_enum.dart';

class GenderBottomSheet extends StatelessWidget {
  final Gender? selectedGender;

  const GenderBottomSheet({super.key, this.selectedGender});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20.h),

          Row(
            children: [
              Icon(Icons.person_outline, size: 28.sp),
              SizedBox(width: 10.w),
              Text(
                AppLocalizations.of(context)!.gender,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 25.h),

          SelectionOptionItem(
            title: local.male,
            isSelected: selectedGender == Gender.male,
            onTap: () => Navigator.pop(context, Gender.male),
          ),
          SizedBox(height: 10.h),
          SelectionOptionItem(
            title: local.female,
            isSelected: selectedGender == Gender.female,
            onTap: () => Navigator.pop(context, Gender.female), // بنرجع النوع المختار
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
