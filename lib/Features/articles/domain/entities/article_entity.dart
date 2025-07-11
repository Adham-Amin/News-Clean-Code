import 'package:news_route/Features/articles/domain/entities/source_entity.dart';

class ArticleEntity {
  final String titleArticle;
  final String descriptionArticle;
  final String urlArticle;
  final String urlToImageArticle;
  final String publishedAtArticle;
  final String contentArticle;
  final SourceEntity sourceModel;

  const ArticleEntity({
    required this.sourceModel,
    required this.titleArticle,
    required this.descriptionArticle,
    required this.urlArticle,
    required this.urlToImageArticle,
    required this.publishedAtArticle,
    required this.contentArticle,
  });
}