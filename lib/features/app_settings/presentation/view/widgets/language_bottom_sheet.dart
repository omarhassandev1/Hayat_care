import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/app_settings/presentation/cubit/app_settings_cubit.dart';
import 'package:hayat_care/features/app_settings/presentation/cubit/app_settings_state.dart';
import 'package:hayat_care/features/app_settings/presentation/view/widgets/selection_option_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(10))),
          SizedBox(height: 20.h),
          Row(
            children: [
              Icon(Icons.language, color: Colors.blue, size: 28.sp),
              SizedBox(width: 10.w),
              Text(AppLocalizations.of(context)!.language, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 25.h),
          BlocBuilder<AppSettingCubit, AppSettingState>(
            builder: (context, state) {
              return Column(
                children: [
                  SelectionOptionItem(
                    title: 'اللغة العربية',
                    isSelected: state.locale.languageCode == 'ar',
                    onTap: () {
                      context.read<AppSettingCubit>().changeLanguage('ar');
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 10.h),
                  SelectionOptionItem(
                    title: 'English',
                    isSelected: state.locale.languageCode == 'en',
                    onTap: () {
                      context.read<AppSettingCubit>().changeLanguage('en');
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}