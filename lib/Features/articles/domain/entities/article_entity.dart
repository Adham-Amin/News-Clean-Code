import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';

part 'article_entity.g.dart';
@HiveType(typeId: 1)
class ArticleEntity {

  @HiveField(0)
  final String titleArticle;
  @HiveField(1)
  final String descriptionArticle;
  @HiveField(2)
  final String urlArticle;
  @HiveField(3)
  final String urlToImageArticle;
  @HiveField(4)
  final String publishedAtArticle;
  @HiveField(5)
  final String contentArticle;
  @HiveField(6)
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