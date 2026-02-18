import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/article_category_enum.dart';

import '../../cubit/articles_cubit.dart';
import '../../cubit/articles_state.dart';
import 'detailed_article_card.dart';

class ArticlesListSection extends StatelessWidget {
  const ArticlesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ArticlesLoadSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 24.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
