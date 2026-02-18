import 'package:equatable/equatable.dart';

import '../../../../core/enums/article_category_enum.dart';

class ArticleEntity extends Equatable{
  final String id;
  final String title;
  final String content;
  final String authorId;
  final String authorName;
  final ArticleCategory category;
  final DateTime publishedAt;
  final String imageUrl;

  const ArticleEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.authorName,
    required this.category,
    required this.publishedAt,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
