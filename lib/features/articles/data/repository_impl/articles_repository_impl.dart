import 'package:injectable/injectable.dart';

import '../../../../core/enums/article_category_enum.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/repository/articles_repository.dart';

@LazySingleton(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final List<ArticleEntity> _mockArticles = [
    ArticleEntity(
      id: '1',
      title: 'Covid-19 Reinfections May Increase Risk Covid-19 Reinfections May Increase Risk ',
      content: 'Full content here...',
      authorId: 'doc1',
      authorName: 'Dr. Ahmed',
      category: ArticleCategory.covid19,
      publishedAt: DateTime.now(),
      imageUrl:
          'https://www.un.org/sites/un2.un.org/files/field/image/1583952355.1997.jpg',
    ),
    ArticleEntity(
      id: '2',
      title: 'Healthy Lifestyle Tips',
      content: 'Full content here...',
      authorId: 'doc2',
      authorName: 'Dr. Sara',
      category: ArticleCategory.lifestyle,
      publishedAt: DateTime.now(),
      imageUrl:'https://blog.orthoindy.com/wp-content/uploads/2020/08/orthoindy-a-healthy-environment-could-lead-to-a-healthy-lifestyle.jpg'
    ),
  ];

  @override
  Future<List<ArticleEntity>> getArticles({ArticleCategory? category}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (category == null) {
      return _mockArticles;
    }

    return _mockArticles
        .where((article) => article.category == category)
        .toList();
  }

  @override
  Future<List<ArticleEntity>> getFavoriteArticles() async{
    return _mockArticles.sublist(1);
  }



}
