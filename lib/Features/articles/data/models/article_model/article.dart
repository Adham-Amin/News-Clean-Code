import 'package:news_route/Features/articles/data/models/source_model/source_model.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
            sourceModel: source!,
            titleArticle: title ?? 'No title',
            descriptionArticle: description ?? 'No description',
            urlArticle: url ?? 'No url',
            urlToImageArticle: urlToImage ?? 'No url to image',
            publishedAtArticle: publishedAt ?? 'No published at',
            contentArticle: content ?? 'No content');

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: json['source'] == null
            ? null
            : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };
}
