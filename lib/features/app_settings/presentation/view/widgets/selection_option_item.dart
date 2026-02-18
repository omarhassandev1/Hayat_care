import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionOptionItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionOptionItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Colors.blue[700] : (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, color: Colors.blue[700], size: 22.sp),
          ],
        ),
      ),
    );
  }
}