import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  static const String routeName = 'changePasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.changePassword,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.w),
        child: Column(
          children: [
            CustomTextField(
              labelText: AppLocalizations.of(context)!.password_label,
              hintText: AppLocalizations.of(context)!.passwordHint,
              isPassword: true,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              labelText: AppLocalizations.of(context)!.confirm_password_label,
              hintText: AppLocalizations.of(context)!.passwordHint,
              isPassword: true,
            ),
            Spacer(),
            SafeArea(
              child: Row(
                children: [
                  CustomMainButton(label: AppLocalizations.of(context)!.changePassword),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
