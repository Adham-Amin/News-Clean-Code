import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/Features/articles/domain/entities/article_entity.dart';
import 'package:news_route/Features/search/domain/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchArticles({required String q}) async {
    emit(SearchLoading());
    var result = await searchRepo.search(q: q);
    result.fold((failure) => emit(SearchFailure(message: failure.message)),
        (articles) => emit(SearchSuccess(articles: articles)));
  }
}
