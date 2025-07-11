part of 'sources_cubit.dart';

sealed class SourcesState extends Equatable {
  const SourcesState();

  @override
  List<Object> get props => [];
}

final class SourcesInitial extends SourcesState {}
final class SourcesLoading extends SourcesState {}
final class SourcesSuccess extends SourcesState {
  final List<SourceEntity> sources;
  const SourcesSuccess({required this.sources});
}
final class SourcesFailure extends SourcesState {
  final String message;
  const SourcesFailure({required this.message});
}
