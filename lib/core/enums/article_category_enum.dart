enum ArticleCategory {
  health,
  covid19,
  lifestyle,
  addiction,
  eyes,
  heart
}

extension ArticleCategoryExtension on ArticleCategory {
  String get displayName {
    switch (this) {
      case ArticleCategory.health:
        return "Health";
      case ArticleCategory.covid19:
        return "Covid-19";
      case ArticleCategory.lifestyle:
        return "Lifestyle";
      case ArticleCategory.addiction:
        return "Addiction";
      case ArticleCategory.eyes:
        return "Eyes";
      case ArticleCategory.heart:
        return "Heart";
    }
  }
}
