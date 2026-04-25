import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { success, error, warning }

class CustomSnackBar extends StatelessWidget {
  final String message;
  final SnackBarType type;
  final IconData? prefixIcon;

  const CustomSnackBar({
    super.key,
    required this.message,
    this.type = SnackBarType.success,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final color = _getFillColor(type, isDark);
    final icon = prefixIcon ?? _getDefaultIcon(type);

    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _getIconColor(type),width: 1.5.r)
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: _getIconColor(type), size: 24.r),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(message, style:  TextStyle(color: _getIconColor(type))),
            ),
          ],
        ),
    );
  }

  Color _getFillColor(SnackBarType type, bool isDark) {
    switch (type) {
      case SnackBarType.success:
        return isDark ? Color(0xff00260F) : Color(0xffe6faee);
      case SnackBarType.error:
        return isDark ? Color(0xff261213) : Color(0xfff7e6e7);
      case SnackBarType.warning:
        return isDark ? Color(0xff1c1500) : Color(0xfff7f4e6);
    }
  }

  Color _getIconColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Color(0xff05DF72);
      case SnackBarType.error:
        return Color(0xffB10810);
      case SnackBarType.warning:
        return Color(0xffB78900);
    }
  }

  IconData? _getDefaultIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle_outline_outlined;
      case SnackBarType.error:
        return Icons.cancel_outlined;
      case SnackBarType.warning:
        return Icons.error_outline_rounded;
    }
  }
}
