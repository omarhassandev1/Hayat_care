import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.hintColor,
    this.maxLines = 1,
    this.controller,
    this.isPassword = false,
    this.onChanged,
    this.labelText,
  });

  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Color? hintColor;
  final int? maxLines;
  final TextEditingController? controller;
  final bool isPassword;
  void Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPassword = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Column(
            children: [
              Text(
                widget.labelText!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 5.h,)
            ],
          ),
        TextFormField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          validator: widget.validator,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: _getBorder(AppColors.mainColor),
            enabledBorder: _getBorder(AppColors.lightGreyColor),
            disabledBorder: _getBorder(AppColors.lightGreyColor),
            errorBorder: _getBorder(AppColors.redColor),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.remove_red_eye,
                      color: AppColors.greyColor,
                      size: 20,
                    ),
                  )
                : null,
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  _getBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
