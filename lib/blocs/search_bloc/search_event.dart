part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchInitial extends SearchEvent {}

class SearchStudent extends SearchEvent {
  final String text;

  SearchStudent({required this.text});
}
