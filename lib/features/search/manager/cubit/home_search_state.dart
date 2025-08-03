part of 'home_search_cubit.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();

  @override
  List<Object> get props => [];
}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeSearchLoading extends HomeSearchState {}

final class HomeSearchLoaded extends HomeSearchState {
  final List<DrugModel> results;

  const HomeSearchLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

final class HomeSearchError extends HomeSearchState {
  final String message;

  const HomeSearchError({required this.message});

  @override
  List<Object> get props => [message];
}
