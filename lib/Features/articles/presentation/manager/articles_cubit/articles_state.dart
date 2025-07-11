part of 'articles_cubit.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesInitial extends ArticlesState {}
final class ArticlesLoading extends ArticlesState {}

final class ArticlesSuccess extends ArticlesState {
  final List<ArticleEntity> articles;
  const ArticlesSuccess({required this.articles});
}

final class ArticlesFailure extends ArticlesState {
  final String message;
  const ArticlesFailure({required this.message});
}
