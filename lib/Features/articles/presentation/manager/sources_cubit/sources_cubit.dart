import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/Features/articles/domain/entities/source_entity.dart';
import 'package:news_route/Features/articles/domain/repos/article_repo.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit({required this.articleRepo}) : super(SourcesInitial());

  final ArticleRepo articleRepo;
  Future<void> getSources({required String category}) async {
    emit(SourcesLoading());
    var result = await articleRepo.getSources(category: category);
    result.fold(
      (faliure) {
        emit(SourcesFailure(message: faliure.message));
      },
      (sources) {
        emit(SourcesSuccess(sources: sources));
      },
    );
  }
}
