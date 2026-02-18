import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key, required this.items, required this.isDark});
  final List<Widget> items;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: !isDark ? Border.all(color: Colors.grey[200]!) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ListView.separated(
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
