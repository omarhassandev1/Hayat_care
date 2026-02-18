import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:pinput/pinput.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import 'new_password_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.otp_title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D74FF),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${AppLocalizations.of(context)!.otp_brief} omarmedhat884@gmail.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => SizedBox(width: 35.w),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.otp_not_received,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.resend,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text("00:59 s", style: TextStyle(color: Colors.green)),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  CustomMainButton(
                    label: AppLocalizations.of(context)!.confirm_button,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewPasswordScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
