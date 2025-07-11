import 'package:news_route/Core/services/api_service.dart';
import 'package:news_route/Features/articles/data/models/article_model/article_model.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';

abstract class RemoteSearchDataSource {
  Future<List<ArticleEntity>> getSearch({required String q});
}

class RemoteSearchDataSourceImpl implements RemoteSearchDataSource {

  final ApiService api;
  RemoteSearchDataSourceImpl({required this.api});

  final String _apiKey = '1a7ff1d3573d424fb455194062391d2c';
  @override
  Future<List<ArticleEntity>> getSearch({required String q}) async {
    var response = await api.get(endPoint: '/everything?apiKey=$_apiKey&q=$q');

    List<ArticleEntity> articlesList = [];
    for (var article in response['articles']) {
      articlesList.add(ArticleModel.fromJson(article));
    }
    
    return articlesList;
  }
}
