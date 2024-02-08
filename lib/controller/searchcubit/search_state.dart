part of 'search_cubit.dart';


abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class ChangeIsEmpty extends SearchState {}
final class AddSearch extends SearchState {}
final class ShowAllRecentSearches extends SearchState {}

final class AddRecentSearches extends SearchState {}
final class DeleteRecentSearcheJob extends SearchState {}
final class JobTypeAdd extends SearchState {}
final class JobTyperemoved extends SearchState {}
final class ClearingJopType extends SearchState {}
final class ClearSearch extends SearchState {}
