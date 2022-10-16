part of 'student_bloc.dart';

class StudentState {
  final List studentList;

  const StudentState({required this.studentList});
}

class InitialState extends StudentState {
  InitialState() : super(studentList: []);
}
