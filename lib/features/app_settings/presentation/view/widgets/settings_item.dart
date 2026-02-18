import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isDark, this.textColor, this.iconColor, this.onPressed,
  });
  final Widget icon;
  final String title;
  final bool isDark;
  final Color? textColor;
  final Color? iconColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: textColor,fontSize: 14.sp),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor?? (isDark? Colors.white: Colors.black)),
      onTap: onPressed,
    );
  }
}
