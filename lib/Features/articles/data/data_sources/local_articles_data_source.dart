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
  Future<List<ArticleEntity>> getArticles({required String sourceId}) async {
    var box = Hive.box(kArticlesBox);
    var data = box.get(sourceId);
    if (data != null && data is List<ArticleEntity>) {
      return data;
    } else {
      return [];
    }
  }

  @override
  Future<List<SourceEntity>> getSources({required String category}) async {
    var box = Hive.box(kArticlesBox);
    var data = box.get(category);
    if (data != null && data is List<SourceEntity>) {
      return data;
    } else {
      return [];
    }
  }
}
