import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_route/Core/error/failure.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/search/data/data_source/local_search_data_source.dart';
import 'package:news_route/Features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final RemoteSearchDataSource remoteSearchDataSource;

  SearchRepoImpl({required this.remoteSearchDataSource});
  @override
  Future<Either<Failure, List<ArticleEntity>>> search(
      {required String q}) async {
    try {
      var data = await remoteSearchDataSource.getSearch(q: q);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
