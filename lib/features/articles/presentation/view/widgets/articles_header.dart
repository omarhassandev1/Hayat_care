import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/app_localizations.dart';
import '../screens/articles_bookmarks_screen.dart';
import '../screens/articles_search_screen.dart';

class ArticlesHeader extends StatelessWidget {
  const ArticlesHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 17.h,
          horizontal: 20.w,
        ),
        child: Row(
          children: [
            Assets.common.logoColored.svg(height: 40.h, width: 40.w),
            SizedBox(width: 8.w),
            Text(
              AppLocalizations.of(context)!.articles,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Spacer(),
            GestureDetector(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticlesSearchScreen(),));
            }, child: Icon(Icons.search, size: 30)),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: () {
              Navigator.of(context).pushNamed(ArticlesBookmarksScreen.routeName);
              },
              child: Icon(Icons.bookmark_outline, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
