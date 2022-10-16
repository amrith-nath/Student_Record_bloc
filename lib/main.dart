import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_login_quik/blocs/alert/delete_alert_bloc.dart';
import 'package:student_login_quik/blocs/image_bloc/image_bloc.dart';
import 'package:student_login_quik/blocs/search_bloc/search_bloc.dart';
import 'package:student_login_quik/blocs/studen_bloc/student_bloc.dart';
import 'package:student_login_quik/core/db/db_functions/db_functions.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/domine/image_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_login_quik/presentation/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<List>(boxName);
  final box = MyBox.getInstance();
  List<dynamic> studentKeys = box.keys.toList();
  if (!studentKeys.contains('studentList')) {
    List<dynamic> studentList = [];
    await box.put('studentList', studentList);
  }

  // box.add(StudentModel(
  //     name: 'Amar', age: '24', height: '182', gender: 'Male', image: 'ghggh'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => StudentBloc()),
        BlocProvider(create: (ctx) => ImageBloc(ImageRepo())),
        BlocProvider(create: (ctx) => SearchBloc()),
        BlocProvider(create: (ctx) => DeleteAlertBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student profile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
