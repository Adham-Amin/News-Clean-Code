import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_route/Core/services/api_service.dart';
import 'package:news_route/Features/articles/data/models/article_model/article_model.dart';
import 'package:news_route/Features/articles/data/models/source_model/source_model.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';
import 'package:news_route/constants.dart';

abstract class RemoteArticlesDataSource {
  Future<List<SourceEntity>> getSources({required String category});
  Future<List<ArticleEntity>> getArticles({required String sourceId});
}

class RemoteArticlesDataSourceImpl implements RemoteArticlesDataSource {
  final ApiService api;
  RemoteArticlesDataSourceImpl({required this.api});

  final String _apiKey = '1a7ff1d3573d424fb455194062391d2c';
  @override
  Future<List<ArticleEntity>> getArticles({required String sourceId}) async {
    final response = await api.get(
        endPoint: '/everything?apiKey=$_apiKey&sources=$sourceId');

    List<ArticleEntity> articlesList = [];
    for (var article in response['articles']) {
      articlesList.add(ArticleModel.fromJson(article));
    }
    var box = Hive.box(kArticlesBox);
    box.put(sourceId, articlesList);
    return articlesList;
  }

  @override
  Future<List<SourceEntity>> getSources({required String category}) async {
    final response = await api.get(
        endPoint: '/top-headlines/sources?apiKey=$_apiKey&category=$category');

    List<SourceEntity> sourcesList = [];
    for (var source in response['sources']) {
      sourcesList.add(SourceModel.fromJson(source));
    }
    var box = Hive.box(kArticlesBox);
    box.put(category, sourcesList);
    return sourcesList;
  }
}
