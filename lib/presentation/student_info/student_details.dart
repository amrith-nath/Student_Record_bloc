import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/my_functions/my_functions.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage(this.student, {Key? key}) : super(key: key);
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
        title: bodyText('Student details'),
        backgroundColor: colorNavLight(),
      ),
      body: Container(
        color: colorNavLight(),
        child: Padding(
          padding: paddingFunction(width, height1),
          child: ListView(
            children: [
              sizedBoxHere(height1),
              CircleAvatar(
                radius: 105,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: ClipOval(
                    child: Image.file(
                      File(student.image!),
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ),
              ),
              sizedBoxHere(height1 * 2),
              Column(
                children: [
                  bodyTextblue('Name'),
                  bodyText(student.name),
                  sizedBoxHere(height1),
                  bodyTextblue('Age'),
                  bodyText(student.age),
                  sizedBoxHere(height1),
                  bodyTextblue('Height'),
                  bodyText(student.height),
                  sizedBoxHere(height1),
                  bodyTextblue('Gender'),
                  bodyText(student.gender),
                  sizedBoxHere(height1),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
