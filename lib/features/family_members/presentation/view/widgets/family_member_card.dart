import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/gender_enum.dart';
import 'package:hayat_care/features/family_members/domain/entities/family_member_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class FamilyMemberCard extends StatelessWidget {
  final FamilyMemberEntity member;

  const FamilyMemberCard({super.key, required this.member});

  bool get _isMale => member.gender == Gender.male;

  Color get _primaryColor =>
      _isMale ? AppColors.mainColor : const Color(0xFFFF3C88);

  List<Color> get _gradientColors => _isMale
      ? [const Color(0xFF448AFF), const Color(0xFF2962FF)]
      : [const Color(0xFFFF78AB), const Color(0xFFFF3C88)];

  Color _bgColor(bool isDark) => _isMale
      ? (isDark
      ? AppColors.mainColor.withValues(alpha: 0.10)
      : const Color(0xFFF0F9FF))
      : (isDark
      ? const Color(0xFFFF3C88).withValues(alpha: 0.10)
      : const Color(0xFFFFF0F9));

  int _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  String _maskId(String id) {
    if (id.length < 8) return id;
    return "${id.substring(0, 4)} •••• ${id.substring(id.length - 4)}";
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: _primaryColor.withValues(alpha: 0.3),width: 2.5.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                spacing: 12.w,
                children: [
                  Assets.profile.editIcon.svg(),
                  Assets.profile.removeIcon.svg(),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Icon(Icons.people_outline, color: _primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                member.relationship,
                style: TextStyle(
                  color: _primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _buildInfoTile(
            context: context,
            label:
            "${AppLocalizations.of(context)!.age} | ${AppLocalizations.of(context)!.dateOfBirth}",
            value:
            "${_calculateAge(member.birthDate)} ${AppLocalizations.of(context)!.yearsOld} • ${DateFormat.yMEd().format(member.birthDate)}",
            icon: Icons.calendar_today,
            bgColor: _bgColor(isDark),
          ),

          const SizedBox(height: 16),

          _buildInfoTile(
            context: context,
            label: AppLocalizations.of(context)!.nationalId,
            value: _maskId(member.nationalId),
            icon: Icons.credit_card,
            bgColor: _bgColor(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required Color bgColor,
  }) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: bgColor.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: _primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}