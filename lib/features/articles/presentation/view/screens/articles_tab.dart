import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../../localization/app_localizations.dart';
import '../../cubit/articles_cubit.dart';
import '../widgets/articles_filter_section.dart';
import '../widgets/articles_header.dart';
import '../widgets/articles_list_section.dart';
import '../widgets/articles_trending_section.dart';


class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ArticlesCubit>()..loadArticles(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticlesHeader(),
              ArticlesTrendingSection(),
              SectionHeader(label: AppLocalizations.of(context)!.articles),
              ArticlesFilterSection(),
              ArticlesListSection(),
            ],
          ),
        ),
      ),
    );
  }
}

