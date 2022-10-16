import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(InitialState()) {
    on<GetStudentsEvent>(
      (event, emit) {
        if (true) {
          var studentList = MyBox.getStudentList();
          log('GetStudentsEvent => called');
          emit(StudentState(studentList: studentList));
        }
      },
    );
    on<AddStudent>(
      (event, emit) async {
        final box = MyBox.getInstance();
        var studentList = state.studentList;

        studentList.add(event.student);

        await box.put("studentList", studentList);

        emit(StudentState(studentList: studentList));
      },
    );
    on<EditStudent>(
      (
        event,
        emit,
      ) async {
        var box = MyBox.getInstance();
        var studentList = state.studentList;
        var student = event.student;

        studentList[event.index] = student;
        // studentList.removeAt(event.index);

        // studentList.add(student);

        await box.put("studentList", studentList);

        emit(StudentState(studentList: studentList));
      },
    );

    on<DeleteStudent>(
      (
        event,
        emit,
      ) async {
        var box = MyBox.getInstance();
        var studentList = state.studentList;
        studentList.removeAt(event.index);
        await box.put("studentList", studentList);
        log("delete Student => called");

        emit(StudentState(studentList: studentList));
      },
    );
  }
}
