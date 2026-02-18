import 'package:hayat_care/features/articles/domain/repository/articles_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/article_entity.dart';
@lazySingleton
class GetFavoriteArticlesUseCase {
  final ArticlesRepository articlesRepository;

  GetFavoriteArticlesUseCase({required this.articlesRepository});

  Future<List<ArticleEntity>> call() async {
    return await articlesRepository.getFavoriteArticles();
  }
}
