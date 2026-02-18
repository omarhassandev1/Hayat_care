import 'package:flutter/material.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle,
    this.backgroundColor,
  });
  final String label;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.mainColor),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            label,
            style:
                textStyle ??
                Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppColors.mainColor),
          ),
        ),
      ),
    );
  }
}
