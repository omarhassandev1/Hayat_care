import '../../../../core/enums/article_category_enum.dart';
import '../entities/article_entity.dart';

abstract class ArticlesRepository {
  Future<List<ArticleEntity>> getArticles({
    ArticleCategory? category,
  });

  Future<List<ArticleEntity>> getFavoriteArticles();
}
