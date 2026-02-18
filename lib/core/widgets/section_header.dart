import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/app_localizations.dart';
import '../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label, this.seeAllOnPressed});

  final String label;
  final void Function()? seeAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700)),
          Spacer(),
          GestureDetector(
            onTap: seeAllOnPressed,
            child: Text(
              AppLocalizations.of(context)!.seeAll,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: AppColors.mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
