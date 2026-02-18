import '../../domain/entities/article_entity.dart';

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoadSuccess extends ArticlesState {
  final List<ArticleEntity> articles;

  ArticlesLoadSuccess(this.articles);
}

class ArticlesLoadFailure extends ArticlesState {
  final String error;

  ArticlesLoadFailure(this.error);
}
