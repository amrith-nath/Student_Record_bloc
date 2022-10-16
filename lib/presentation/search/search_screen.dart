import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_login_quik/blocs/search_bloc/search_bloc.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/my_functions/my_functions.dart';
import 'package:student_login_quik/my_functions/my_list_tile.dart';

// ignore: camel_case_types
class searchScreen extends StatelessWidget {
  searchScreen({Key? key}) : super(key: key);

  final searchControllar = TextEditingController();
  final studentList = MyBox.getStudentList();

  // final studentObjectList = box.values.toList();
  //--------------------------------------------------
  // void searchStudent(String query) {
  //   final suggestions = studentObjectList.where((currentStudent) {
  //     final studentName = currentStudent.name.toString().toLowerCase();
  //     final input = query.toLowerCase();
  //     return studentObjectList.contains(input);
  //   }).toList();

  //   List currentState;
  //   setState(() => currentState = suggestions);3
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(SearchInitial());
    });

    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width = size.width;

    return Scaffold(
      body: Padding(
        padding: paddingFunction(width, height1),
        child: Column(
          children: [
            TextField(
              controller: searchControllar,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: colorBlue(),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Search'),
              onChanged: (text) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchStudent(text: text));
              },
            ),
            sizedBoxHere(height1),
            ValueListenableBuilder(
              valueListenable: searchControllar,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Expanded(
                  child: SearchList(
                    height1: height1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
    required this.height1,
  }) : super(key: key);

  final double height1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.isFound
            ? ListView.builder(
                itemCount: state.searchList.length,
                itemBuilder: (BuildContext context, int index) {
                  StudentModel currentStudent = state.searchList[index]!;

                  return SizedBox(
                      width: height1,
                      child:
                          MyListTile(currentStudent, index, state.searchList));
                },
              )
            : const Text('No Matches found');
      },
    );
  }
}
