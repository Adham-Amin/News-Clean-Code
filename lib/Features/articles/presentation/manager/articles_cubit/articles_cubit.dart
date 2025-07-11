import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/articles/domain/repos/article_repo.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.articleRepo}) : super(ArticlesInitial());
  final ArticleRepo articleRepo;

  Future<void> getArticles({required String sourceId}) async {
    var result = await articleRepo.getArticles(sourceId: sourceId);
    result.fold(
      (faliure) {
        emit(ArticlesFailure(message: faliure.message));
      },
      (articles) {
        emit(ArticlesSuccess(articles: articles));
      },
    );
  }
}
