import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_login_quik/blocs/studen_bloc/student_bloc.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';

import '../../../my_functions/my_functions.dart';
import '../../../my_functions/my_list_tile.dart';

class StudentList extends StatelessWidget {
  StudentList({
    Key? key,
    required this.width,
    required this.height1,
  }) : super(key: key);

  final double width;
  final double height1;

  final box = MyBox.getInstance();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<StudentBloc>(context).add(GetStudentsEvent());
    });

    // return ValueListenableBuilder(
    //   valueListenable: box.listenable(),
    //   // valueListenable: Hive.box<StudentModel>('students').listenable(),
    //   builder: (context, child, _) {
    //     // final studentList = box.get("studentList");
    //     return Padding(
    //       padding: paddingFunction(width, height1),
    //       child:
    //           BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
    //         return ListView.builder(
    //           itemCount: state.studentList.length,
    //           itemBuilder: (context, index) {
    //             StudentModel currentStudent = state.studentList[index];

    //             return MyListTile(currentStudent, index, state.studentList);
    //           },
    //         );
    //       }),
    //     );
    //   },
    // );
    return Padding(
      padding: paddingFunction(width, height1),
      child: BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
        return ListView.builder(
          itemCount: state.studentList.length,
          itemBuilder: (context, index) {
            StudentModel currentStudent = state.studentList[index];

            return MyListTile(currentStudent, index, state.studentList);
          },
        );
      }),
    );
  }
}
