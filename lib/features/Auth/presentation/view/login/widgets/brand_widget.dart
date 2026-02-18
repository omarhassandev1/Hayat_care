import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({
    super.key, required this.brandImage,
  });
  final Widget brandImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.mainColor,
              width: 1.2
          ),
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: brandImage,
    );
  }
}
