import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/donations_section.dart';
import 'package:hayat_care/features/health/presentation/view/widgets/join_us_card.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../gen/assets.gen.dart';

class HealthTab extends StatelessWidget {
  const HealthTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HealthTabHeader(),
          JoinUsCard(),
          DonationsSection(),
        ],
      ),
    );
  }
}

class HealthTabHeader extends StatelessWidget {
  const HealthTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 17.h, start: 20.w),
        child: Row(
          spacing: 8.w,
          children: [
            Assets.common.logoColored.svg(),
            Text(AppLocalizations.of(context)!.health, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
