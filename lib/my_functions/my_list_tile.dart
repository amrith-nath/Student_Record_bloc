import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_login_quik/blocs/alert/delete_alert_bloc.dart';
import 'package:student_login_quik/blocs/studen_bloc/student_bloc.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/my_functions/alerts/delete_alert.dart';

import 'package:student_login_quik/my_functions/my_functions.dart';
import 'package:student_login_quik/presentation/add_and_edit_screen/add_edit_screen.dart';
import 'package:student_login_quik/presentation/student_info/student_details.dart';

class MyListTile extends StatelessWidget {
  MyListTile(this.student, this.index, this.students, {Key? key})
      : super(key: key);
  final StudentModel student;
  final List students;
  final int index;

  final box = MyBox.getInstance();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return StudentDetailsPage(
            student,
          );
        }));
      }),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorNavLight(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              // backgroundImage: AssetImage(
                              //   widget.profileImage,
                              // ),
                              radius: 30,
                              backgroundColor: Colors.white,
                              // backgroundImage: AssetImage(
                              //   widget.profileImage,
                              // ),
                              child: ClipOval(
                                child: Image.file(
                                  File(student.image!),
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      ),
                      bodyText(student.name)
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return StudentEditor(
                                student: student,
                                index: index,
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.edit_note,
                            color: colorBlue(),
                          )),
                      IconButton(
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return KAlert(student: student, index: index);
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
