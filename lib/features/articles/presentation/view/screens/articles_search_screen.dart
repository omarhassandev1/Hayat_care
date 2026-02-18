import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../../../core/di/injection.dart';
import '../../cubit/articles_cubit.dart';
import '../widgets/articles_filter_section.dart';
import '../widgets/articles_list_section.dart';

class ArticlesSearchScreen extends StatefulWidget {
  const ArticlesSearchScreen({super.key});

  @override
  State<ArticlesSearchScreen> createState() => _ArticlesSearchScreenState();
}

class _ArticlesSearchScreenState extends State<ArticlesSearchScreen> {
  bool isSearching = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ArticlesCubit>()..loadArticles(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: isSearching
                ? TextField(
                    controller: _searchController,
                    autofocus: true,
                    style: Theme.of(context).textTheme.labelMedium,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(
                        context,
                      )!.searchArticlesHint,
                      border: InputBorder.none,
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.labelMedium?.copyWith(color: Colors.grey),
                    ),
                    onChanged: (query) {
                      context.read<ArticlesCubit>().searchArticles(query);
                    },
                  )
                : Text(
                    AppLocalizations.of(context)!.articles,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
            actions: [
              Builder(
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        _searchController.clear();
                        ctx.read<ArticlesCubit>().searchArticles('');
                      }
                    });
                  },
                  child: Icon(
                    isSearching ? Icons.close : Icons.search,
                    size: 30.r,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 24.h,),
              ArticlesFilterSection(),
              Expanded(child: ArticlesListSection()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
