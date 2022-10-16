part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}

// class InitialSearchEvent extends StudentEvent {}

class GetStudentsEvent extends StudentEvent {}

class AddStudent extends StudentEvent {
  final StudentModel student;
  AddStudent({required this.student});
}

class EditStudent extends StudentEvent {
  final int index;
  final StudentModel student;
  EditStudent({required this.index, required this.student});
}

class DeleteStudent extends StudentEvent {
  final int index;

  DeleteStudent({required this.index});
}
