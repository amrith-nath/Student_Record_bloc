import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;

  @HiveField(2)
  String? height;

  @HiveField(3)
  String? gender;

  @HiveField(4)
  String? image;

  StudentModel({this.name, this.age, this.height, this.gender, this.image});
}
