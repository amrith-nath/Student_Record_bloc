import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_login_quik/blocs/image_bloc/image_bloc.dart';
import 'package:student_login_quik/blocs/studen_bloc/student_bloc.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';

import 'package:student_login_quik/my_functions/my_functions.dart';

final _formKey = GlobalKey<FormState>();

class StudentEditor extends StatelessWidget {
  StudentEditor({this.student, this.index, Key? key}) : super(key: key);
  final StudentModel? student;

  final int? index;

  String? profileImage;
//  final bool isClicked = false;

  // Future pickImage({bool isCam = true}) async {
  //   try {
  //     final imagePicker = ImagePicker();

  //     XFile? image;

  //     if (isCam) {
  //       image = await imagePicker.pickImage(source: ImageSource.camera);
  //     } else {
  //       image = await imagePicker.pickImage(source: ImageSource.gallery);
  //     }

  //     if (image == null) {
  //       return null;
  //     }
  //     var newImage = File(image.path);

  //     setState(() {
  //       profileImage = newImage.path;
  //       isClicked = true;
  //     });
  //   } on PlatformException catch (e) {
  //     log("$e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (student == null) {
        BlocProvider.of<ImageBloc>(context).add(InitialEvent());
      } else {
        BlocProvider.of<ImageBloc>(context).add(InitialEvent(student: student));
      }
    });

    profileImage = student == null ? null : student!.image;
    TextEditingController nameController =
        TextEditingController(text: student == null ? null : student!.name!);
    TextEditingController ageController =
        TextEditingController(text: student == null ? null : student!.age!);
    TextEditingController heightController =
        TextEditingController(text: student == null ? null : student!.height!);
    TextEditingController genderController =
        TextEditingController(text: student == null ? null : student!.gender!);

    return Scaffold(
      backgroundColor: colorPurpleLight(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorBlue(),
        elevation: 0.0,
        centerTitle: true,
        title: student == null
            ? bodyTextWhite('Add student')
            : bodyTextWhite('Edit Details'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView(children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Builder(builder: (context) {
                  return Stack(
                    children: [
                      BlocBuilder<ImageBloc, ImageState>(
                        builder: (context, state) {
                          profileImage = state.imagePath;
                          return CircleAvatar(
                            backgroundColor: colorBlue(),
                            radius: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 90,
                              child: profileImage == null
                                  ? ClipOval(
                                      child: Image.asset(
                                          width: 180,
                                          fit: BoxFit.cover,
                                          'assets/istockphoto-1018999828-612x612.jpg'),
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        File(profileImage!),
                                        width: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                              // backgroundImage: AssetImage(
                              //   profileImage != null
                              //       ? profileImage!
                              //       : 'assets/istockphoto-1018999828-612x612.jpg',
                              // ),
                            ),
                          );
                        },
                      ),
                      Builder(builder: (context) {
                        return Positioned(
                          bottom: 20,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => showBottomSheet(
                              context: context,
                              builder: (ctx) => const PopUpImageMenu(),
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 25,
                              child: Icon(
                                Icons.add_a_photo_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              // child: PopUpSelection(),
                            ),
                          ),
                        );
                      })
                    ],
                  );
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              inputBox(
                nameController,
                'Name',
              ),
              const SizedBox(
                height: 20,
              ),
              inputBoxNum(
                ageController,
                'Age',
              ),
              const SizedBox(
                height: 20,
              ),
              inputBoxNum(
                heightController,
                'Height',
              ),
              const SizedBox(
                height: 20,
              ),
              inputBox(
                genderController,
                'Gender',
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (profileImage != null) {
                      if (_formKey.currentState!.validate()) {
                        var newStudent = StudentModel(
                            name: nameController.text,
                            age: ageController.text,
                            height: heightController.text,
                            gender: genderController.text,
                            image: profileImage);

                        if (student == null) {
                          //*Updating
                          // widget.student!.name = newStudent.name;
                          // widget.student!.age = newStudent.age;
                          // widget.student!.height = newStudent.height;
                          // widget.student!.gender = newStudent.gender;
                          // widget.student!.save();
                          // var newStudentList = MyBox.getStudentList() as List;

                          // newStudentList.removeAt(index!);
                          // newStudentList.add(newStudent);

                          // await box.put("studentList", newStudentList);
                          log("add student called");
                          log(profileImage!);
                          BlocProvider.of<StudentBloc>(context)
                              .add(AddStudent(student: newStudent));

                          //*adding new task
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HomeScreen();
                          // }));
                          // box.put(boxName, widget.studentList);
                          Navigator.pop(context);
                        } else {
                          // var newStudentList = MyBox.getStudentList();
                          // //**add new student
                          // newStudentList.add(newStudent);

                          // await box.put("studentList", newStudentList);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return HomeScreen();
                          // }));

                          BlocProvider.of<StudentBloc>(context).add(
                              EditStudent(student: newStudent, index: index!));
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      log("a profile pic is needed");
                    }
                  },
                  icon: const Icon(
                    Icons.save_rounded,
                    color: Colors.black,
                  ),
                  label: bodyText('Save'))
            ]),
          ),
        ),
      ),
    );
  }
}

class PopUpImageMenu extends StatelessWidget {
  const PopUpImageMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: colorNavLight(),
          border: Border(top: BorderSide(width: 5, color: colorBlue()))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              radius: 35,
              child: IconButton(
                onPressed: () {
                  // log('iam working');

                  // pickImage();

                  BlocProvider.of<ImageBloc>(context).add(GetCameraImage());
                },
                icon: const Icon(
                  Icons.add_a_photo_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black38,
              radius: 35,
              child: IconButton(
                onPressed: () {
                  // pickImage(isCam: false);
                  BlocProvider.of<ImageBloc>(context).add(GetGalleryImage());
                },
                icon: const Icon(
                  Icons.photo_album,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpSelection extends StatelessWidget {
  const PopUpSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(
          Icons.save_rounded,
          color: Colors.black,
        ),
        itemBuilder: (context) => const [
              PopupMenuItem(
                value: 1,
                child: ListTile(
                  title: Text('Camera'),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: ListTile(
                  title: Text('Camera'),
                ),
              )
            ]);
  }
}
