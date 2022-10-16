import 'package:hive_flutter/hive_flutter.dart';

String boxName = 'students';

class MyBox {
  static Box<List>? _box;

  static Box<List> getInstance() => _box ??= Hive.box(boxName);

  static getStudentList() => _box!.get('studentList');
}
