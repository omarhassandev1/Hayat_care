import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../articles/presentation/view/widgets/basic_article_card.dart';

class HomeTopArticlesSection extends StatelessWidget {
  const HomeTopArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopArticlesHeader(),
        SizedBox(
          height: 195.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16.w),
            itemCount: 5,
            itemBuilder: (context, index) => BasicArticlesCard(),
            separatorBuilder: (context, index) => SizedBox(width: 16.w,),
          ),
        ),
        SizedBox(height: 32.h,)
      ],
    );
  }
}

class TopArticlesHeader extends StatelessWidget {
  const TopArticlesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.topArticles, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700)),
          Spacer(),
          GestureDetector(
            onTap: (){},
            child: Text(
              AppLocalizations.of(context)!.seeAll,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: AppColors.mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
