import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.hintColor,
    this.maxLines = 1,
    this.controller,
    this.isPassword = false,
    this.onChanged,
    this.labelText,
    this.textInputType,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
  });

  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Color? hintColor;
  final Color? fillColor;
  final int? maxLines;
  final TextEditingController? controller;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final bool? readOnly;

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
              SizedBox(height: 5.h),
            ],
          ),
        TextFormField(
          keyboardType: widget.textInputType,
          controller: widget.controller,
          maxLines: widget.maxLines,
          validator: widget.validator,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: isPassword,
          decoration: InputDecoration(
            fillColor: widget.fillColor,
            filled: widget.fillColor != null ? true : false,
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
          onTap: widget.onTap,
          readOnly: widget.readOnly!,
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
