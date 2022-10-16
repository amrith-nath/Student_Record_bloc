import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

// import 'package:student_login_quik/main.dart';
import 'package:student_login_quik/my_functions/my_functions.dart';
import 'package:student_login_quik/presentation/add_and_edit_screen/add_edit_screen.dart';
import 'package:student_login_quik/presentation/home/widgets/student_list.dart';
import 'package:student_login_quik/presentation/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width = size.width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: bodyTextWhite('Student Model'),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: colorBlue(),
          bottom: const TabBar(
            indicatorColor: Colors.lightBlue,
            indicatorWeight: 5,
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.house),
              ),
              Tab(
                icon: Icon(CupertinoIcons.search),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StudentList(width: width, height1: height1),
            searchScreen(),
            // SizedBox()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return StudentEditor();
            }));
          },
          backgroundColor: colorNavBlue(),
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}
