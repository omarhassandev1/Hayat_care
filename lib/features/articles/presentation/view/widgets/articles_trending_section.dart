import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/section_header.dart';
import '../../../../../localization/app_localizations.dart';
import 'basic_article_card.dart';

class ArticlesTrendingSection extends StatelessWidget {
  const ArticlesTrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: AppLocalizations.of(context)!.trending),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, __) => const BasicArticlesCard(),
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
          ),
        ),
      ],
    );
  }
}
