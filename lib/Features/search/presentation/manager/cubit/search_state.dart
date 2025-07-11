part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<ArticleEntity> articles;
  const SearchSuccess({required this.articles});
}
final class SearchFailure extends SearchState {
  final String message;
  const SearchFailure({required this.message});
}
