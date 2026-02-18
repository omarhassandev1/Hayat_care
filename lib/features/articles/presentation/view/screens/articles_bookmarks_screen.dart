import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/article_category_enum.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../core/di/injection.dart';
import '../../cubit/articles_cubit.dart';
import '../../cubit/articles_state.dart';
import '../widgets/detailed_article_card.dart';

class ArticlesBookmarksScreen extends StatelessWidget {
  const ArticlesBookmarksScreen({super.key});
  static const String routeName = 'articlesBookmarks';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ArticlesCubit>()..getFavoriteArticles(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myBookmark),
          actions: [
            GestureDetector(child: Icon(Icons.search, size: 30.r)),
            SizedBox(width: 16.w),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 20.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ArticlesCubit, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ArticlesLoadSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 24.h),
                  shrinkWrap: true,
                  itemCount: state.articles.length,

                  itemBuilder: (context, index) {
                    final article = state.articles[index];

                    return DetailedArticlesCard(
                      title: article.title,
                      imageUrl: article.imageUrl,
                      category: article.category.displayName,
                      date: article.publishedAt.toString(),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
