import 'package:dartz/dartz.dart';
import 'package:news_route/Core/error/failure.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ArticleEntity>>> search({required String q});
}