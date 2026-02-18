import 'package:flutter/material.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';

import '../../../../../../localization/app_localizations.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.new_password_title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D74FF))),
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.new_password_brief, textAlign: TextAlign.center),
            const SizedBox(height: 40),
            CustomTextField(labelText: AppLocalizations.of(context)!.password_label, hintText: AppLocalizations.of(context)!.passwordHint, isPassword: true),
            const SizedBox(height: 20),
            CustomTextField(labelText: AppLocalizations.of(context)!.confirm_password_label, hintText: AppLocalizations.of(context)!.passwordHint, isPassword: true),
            const SizedBox(height: 40),
            Row(
              children: [
                CustomMainButton(label: AppLocalizations.of(context)!.confirm_button, onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}