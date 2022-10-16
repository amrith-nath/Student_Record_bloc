import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_login_quik/blocs/alert/delete_alert_bloc.dart';
import 'package:student_login_quik/blocs/studen_bloc/student_bloc.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/my_functions/my_functions.dart';

class KAlert extends StatelessWidget {
  KAlert({
    Key? key,
    required this.student,
    required this.index,
  }) : super(key: key);

  final StudentModel student;
  final int index;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DeleteAlertBloc>(context).add(ShrinkState());
    });

    return CupertinoAlertDialog(
      title: const Text("Delete File"),
      content: BlocBuilder<DeleteAlertBloc, DeleteAlertState>(
        builder: (context, state) {
          return Column(
            children: [
              AnimatedContainer(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                duration: const Duration(milliseconds: 100),
                height: state.isSwitched ? 75 : 185,
                onEnd: () {},
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorNavLight(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          width: state.isSwitched ? 10 : 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            radius: state.isSwitched ? 27 : 37,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.file(
                                File(student.image!),
                                width: state.isSwitched ? 50 : 70,
                                height: state.isSwitched ? 50 : 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(student.name!,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: state.isSwitched ? 18 : 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ))),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (!state.isSwitched) {
                              BlocProvider.of<DeleteAlertBloc>(context)
                                  .add(ShrinkState());
                            }
                            if (state.isSwitched) {
                              BlocProvider.of<DeleteAlertBloc>(context)
                                  .add(ExpandedState());
                            }

                            // if (state.isSwitched) {
                            //   log("IsSwitched is == ${state.isSwitched}");

                            // BlocProvider.of<
                            //             DeleteAlertBloc>(
                            //         context)
                            //     .add(ExpandedState());
                            // } else if (!state
                            //     .isSwitched) {
                            //   log("IsSwitched is -- ${state.isSwitched}");

                            //   BlocProvider.of<
                            //               DeleteAlertBloc>(
                            //           context)
                            //       .add(ShrinkState());
                            // }
                          },
                          child: Icon(
                            CupertinoIcons.chevron_down_circle,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: !state.isSwitched
                          ? Column(
                              children: [
                                infoTile(
                                    title: "Name",
                                    info: student.name!,
                                    isswitched: state.isSwitched),
                                infoTile(
                                    title: "Age",
                                    info: student.age!,
                                    isswitched: state.isSwitched),
                                infoTile(
                                    title: "Height",
                                    info: student.height!,
                                    isswitched: state.isSwitched),
                                infoTile(
                                    title: "Gender",
                                    info: student.gender!,
                                    isswitched: state.isSwitched),
                              ],
                            )
                          : SizedBox(),
                    )
                  ],
                ),
              ),
              const Text("Are you sure you want to delete the file?"),
            ],
          );
        },
      ),
      actions: [
        CupertinoDialogAction(
            child: const Text(
              "YES",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              BlocProvider.of<StudentBloc>(context)
                  .add(DeleteStudent(index: index));
              Navigator.of(context).pop();
            }),
        CupertinoDialogAction(
          child: const Text(
            "NO",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

infoTile(
    {required String title, required String info, required bool isswitched}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("$title  :",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            // fontSize: 8,
            fontSize: !isswitched ? 12 : 1,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ))),
      const SizedBox(
        width: 10,
      ),
      Text(info,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            // fontSize: 12,
            fontSize: !isswitched ? 12 : 1,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ))),
    ],
  );
}
