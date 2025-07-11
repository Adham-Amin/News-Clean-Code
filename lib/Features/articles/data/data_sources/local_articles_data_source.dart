import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';
import 'package:news_route/constants.dart';

abstract class LocalArticlesDataSource {
  Future<List<SourceEntity>> getSources({required String category});
  Future<List<ArticleEntity>> getArticles({required String sourceId});
}

class LocalArticlesDataSourceImpl implements LocalArticlesDataSource {
  @override
  Future<List<ArticleEntity>> getArticles({required String sourceId}) {
    var box = Hive.box(kArticlesBox);
    return box.get(sourceId);
  }

  @override
  Future<List<SourceEntity>> getSources({required String category}) {
    var box = Hive.box(kArticlesBox);
    return box.get(category);
  }
}