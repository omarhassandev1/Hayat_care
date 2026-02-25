import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/family_members/domain/entities/family_member_entity.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class FamilyMemberCard extends StatelessWidget {
  final FamilyMemberEntity member;

  const FamilyMemberCard({super.key, required this.member});

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
        border: isDark ? null : Border.all(color: Colors.grey.shade100),
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
              const Icon(Icons.people_outline, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              Text(
                member.relationship,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _buildInfoTile(
            label:
                "${AppLocalizations.of(context)!.age} | ${AppLocalizations.of(context)!.dateOfBirth}",
            value:
                "${_calculateAge(member.birthDate)} ${AppLocalizations.of(context)!.yearsOld} • ${DateFormat.yMEd().format(member.birthDate)}",
            icon: Icons.calendar_today,
            gradient: const [Color(0xFF448AFF), Color(0xFF2962FF)],
            bgColor: isDark
                ? AppColors.mainColor.withValues(alpha: .10)
                : const Color(0xFFF0F9FF),
            labelColor: AppColors.mainColor,
          ),

          const SizedBox(height: 16),

          _buildInfoTile(
            label: AppLocalizations.of(context)!.nationalId,
            value: _maskId(member.nationalId),
            icon: Icons.credit_card,
            gradient: const [Color(0xFFE040FB), Color(0xFFD500F9)],
            bgColor: isDark
                ? const Color(0xFFD500F9).withValues(alpha: .10)
                : const Color(0xFFFFF0F9),
            labelColor: const Color(0xFFD500F9),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required String label,
    required String value,
    required IconData icon,
    required List<Color> gradient,
    required Color bgColor,
    required Color labelColor,
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
                colors: gradient,
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
                  color: labelColor,
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
