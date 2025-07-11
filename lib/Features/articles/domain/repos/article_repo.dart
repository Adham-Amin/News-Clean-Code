import 'package:dartz/dartz.dart';
import 'package:news_route/Core/error/failure.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';

abstract class ArticleRepo {
  Future<Either<Failure, List<SourceEntity>>> getSources({required String category});
  Future<Either<Failure, List<ArticleEntity>>> getArticles({required String sourceId}); 
}