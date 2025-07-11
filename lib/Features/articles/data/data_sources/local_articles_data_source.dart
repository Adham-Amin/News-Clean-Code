import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';

abstract class LocalArticlesDataSource {
  Future<List<SourceEntity>> getSources({required String category});
  Future<List<ArticleEntity>> getArticles({required String sourceId});
}

class LocalArticlesDataSourceImpl implements LocalArticlesDataSource {
  @override
  Future<List<ArticleEntity>> getArticles({required String sourceId}) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<List<SourceEntity>> getSources({required String category}) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}