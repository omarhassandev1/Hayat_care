import 'package:flutter/material.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../../core/widgets/custom_main_button.dart';
import '../../login/widgets/auth_header.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              AuthHeader(title: AppLocalizations.of(context)!.forget_password_title, brief: AppLocalizations.of(context)!.forget_password_brief),
              const SizedBox(height: 40),
              CustomTextField(labelText: AppLocalizations.of(context)!.email_label, hintText: AppLocalizations.of(context)!.emailHint,),
              const SizedBox(height: 30),
              Row(
                children: [
                  CustomMainButton(label: AppLocalizations.of(context)!.reset_password_button, onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPScreen(),));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}