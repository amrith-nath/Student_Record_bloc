import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialSearch()) {
    on<SearchInitial>((event, emit) {
      emit(const SearchState(searchList: [], isFound: true));
    });

    on<SearchStudent>(
      (event, emit) {
        var studentList = MyBox.getStudentList();
        var newList = [];
        for (var e in studentList) {
          if (e.name.toString().toLowerCase().contains(event.text)) {
            newList.add(e);
          }
        }
        if (newList.isNotEmpty) {
          emit(SearchState(searchList: newList, isFound: true));
        } else {
          emit(SearchState(searchList: newList, isFound: false));
        }
      },
    );
  }
}
