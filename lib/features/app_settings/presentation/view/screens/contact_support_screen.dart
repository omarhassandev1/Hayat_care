import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/core/widgets/custom_textfield.dart';
import 'package:hayat_care/features/app_settings/presentation/view/screens/message_success_screen.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hayat_care/features/profile/presentation/cubit/profile_state.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});
  static const String routeName = 'contactSupportScreen';

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileCubit>().state;
    if (state is ProfileLoaded) {
      _nameController = TextEditingController(text: state.user.name);
      _emailController = TextEditingController(text: state.user.email);
    } else {
      _nameController = TextEditingController();
      _emailController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(
        context,
      ).pushReplacementNamed(MessageSuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.sendAMessage,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                labelText: locale.fullName,
                hintText: locale.fullNameHint,
                controller: _nameController,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? locale.required : null,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                labelText: locale.email,
                hintText: locale.emailHint,
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return locale.required;
                  if (!v.contains('@')) return locale.enterValidEmail;
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                labelText: locale.phoneNumber,
                hintText: locale.phoneNumberHint,
                controller: _phoneController,
                textInputType: TextInputType.phone,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? locale.required : null,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                labelText: locale.enterYourMessage,
                hintText: locale.enterYourMessageHint,
                controller: _messageController,
                maxLines: 5,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? locale.required : null,
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  CustomMainButton(
                    onPressed: _submit,
                    label: locale.sendYourMessage,
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
