import 'package:flutter/material.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle, this.fillColor,
  });
  final String label;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: fillColor??AppColors.mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            label,
            style:
                textStyle ??
                Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
