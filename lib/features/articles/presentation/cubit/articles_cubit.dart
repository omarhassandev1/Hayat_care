import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/features/articles/domain/use_cases/get_favorite_articles_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/article_category_enum.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/use_cases/get_articles_usecase.dart';
import 'articles_state.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  final GetArticlesUseCase getArticlesUseCase;
  final GetFavoriteArticlesUseCase getFavoriteArticlesUseCase;

  List<ArticleEntity> _allArticles = [];
  ArticleCategory? selectedCategory;

  ArticlesCubit(this.getArticlesUseCase, this.getFavoriteArticlesUseCase)
    : super(ArticlesInitial());

  Future<void> loadArticles({ArticleCategory? category}) async {
    emit(ArticlesLoading());

    selectedCategory = category;

    try {
      final articles = await getArticlesUseCase(category: category);
      _allArticles = articles;

      emit(ArticlesLoadSuccess(articles));
    } catch (e) {
      emit(ArticlesLoadFailure(e.toString()));
    }
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      emit(ArticlesLoadSuccess(_allArticles));
    } else {
      final filteredList = _allArticles.where((article) {
        return article.title.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(ArticlesLoadSuccess(filteredList));
    }
  }

  void getFavoriteArticles() async {
    emit(ArticlesLoading());
    try {
      final favoriteArticles = await getFavoriteArticlesUseCase.call();
      emit(ArticlesLoadSuccess(favoriteArticles));
    } catch (e) {
      emit(ArticlesLoadFailure(e.toString()));
    }
  }
}
