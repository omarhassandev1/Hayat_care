import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/core/widgets/custom_main_button.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool get _isValid =>
      _nameController.text.isNotEmpty &&
      _numberController.text.length == 19 &&
      _expiryController.text.length == 5 &&
      _cvvController.text.length == 3;

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var local = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.addNewCard,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CardPreview(
                      name: _nameController.text,
                      number: _numberController.text,
                      expiry: _expiryController.text,
                    ),
                    SizedBox(height: 32.h),

                    _buildLabel(local.cardHolderName),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _nameController,
                      hint: 'Omar Medhat Mohamed',
                      isDark: isDark,
                    ),
                    SizedBox(height: 20.h),

                    _buildLabel(local.cardNumber),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _numberController,
                      hint: '5078 4789 6544 2311',
                      isDark: isDark,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        _CardNumberFormatter(),
                      ],
                      maxLength: 19,
                    ),
                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel(local.expiryDate),
                              SizedBox(height: 8.h),
                              _buildTextField(
                                controller: _expiryController,
                                hint: '12/30',
                                isDark: isDark,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  _ExpiryDateFormatter(),
                                ],
                                maxLength: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('CVV'),
                              SizedBox(height: 8.h),
                              _buildTextField(
                                controller: _cvvController,
                                hint: '975',
                                isDark: isDark,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                maxLength: 3,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 24.h,
                top: 8.h,
              ),
              child: SizedBox(
                height: 57.h,
                child: Row(
                  children: [
                    !_isValid
                        ? CustomMainButton(
                            label: local.next,
                            fillColor: AppColors.mainColor.withValues(alpha: .40),
                          )
                        : CustomMainButton(
                            label: local.confirm,
                            onPressed: () => Navigator.pop(context),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14.sp),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required bool isDark,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      obscureText: obscureText,
      onChanged: (_) => setState(() {}),
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        counterText: '',
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: isDark ? AppColors.darkCardColor : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}

class _CardPreview extends StatelessWidget {
  final String name;
  final String number;
  final String expiry;

  const _CardPreview({
    required this.name,
    required this.number,
    required this.expiry,
  });

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xff3b2fd4), Color(0xff6c3fd4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.memory, color: Colors.amber, size: 32.r),
              Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            number.isEmpty ? '**** **** **** ****' : number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local.cardHolderName,
                      style: TextStyle(color: Colors.white60, fontSize: 11.sp),
                    ),
                    Text(
                      name.isEmpty ? '**** ****' : name,
                      style: TextStyle(color: Colors.white, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local.expiryDate,
                    style: TextStyle(color: Colors.white60, fontSize: 11.sp),
                  ),
                  Text(
                    expiry.isEmpty ? '**/**' : expiry,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(text[i]);
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
