part of 'search_bloc.dart';

class SearchState {
  final List searchList;
  final bool isFound;

  const SearchState({required this.isFound, required this.searchList});
}

class InitialSearch extends SearchState {
  InitialSearch() : super(searchList: [], isFound: true);
}
