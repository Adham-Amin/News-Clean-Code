import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_route/Core/error/failure.dart';
import 'package:news_route/Features/articles/data/data_sources/local_articles_data_source.dart';
import 'package:news_route/Features/articles/data/data_sources/remote_articles_data_source.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';
import 'package:news_route/Features/articles/domain/repos/article_repo.dart';

class ArticleRepoImpl extends ArticleRepo {
  final RemoteArticlesDataSource remoteArticlesDataSource;
  final LocalArticlesDataSource localArticlesDataSource;

  ArticleRepoImpl({
    required this.remoteArticlesDataSource,
    required this.localArticlesDataSource,
  });

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticles(
      {required String sourceId}) async {
    try {
      final data =
          await localArticlesDataSource.getArticles(sourceId: sourceId);
      if (data.isNotEmpty) return right(data);
      return right(
          await remoteArticlesDataSource.getArticles(sourceId: sourceId));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SourceEntity>>> getSources(
      {required String category}) async {
    try {
      final data = await localArticlesDataSource.getSources(category: category);
      if (data.isNotEmpty) return right(data);
      return right(
          await remoteArticlesDataSource.getSources(category: category));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
