import 'package:injectable/injectable.dart';
import '../../../../core/enums/article_category_enum.dart';
import '../entities/article_entity.dart';
import '../repository/articles_repository.dart';

@lazySingleton
class GetArticlesUseCase {
  final ArticlesRepository repository;

  GetArticlesUseCase(this.repository);

  Future<List<ArticleEntity>> call({
    ArticleCategory? category,
  }) {
    return repository.getArticles(category: category);
  }
}
