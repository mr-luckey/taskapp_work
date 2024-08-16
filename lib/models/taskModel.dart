// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:hive/hive.dart';
part 'taskModel.g.dart';

@HiveType(typeId: 0)
class taskModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? status;
  @HiveField(3)
  List<String> tags;
  @HiveField(4)
  String? ID;
  @HiveField(5)
  String? starttime;
  @HiveField(6)
  String? endtime;
  @HiveField(7)
  String? tasktype;
  @HiveField(8)
  String? startdate;
  @HiveField(9)
  String? enddate;

  taskModel(
      {this.title,
      this.description,
      this.status,
      required this.tags,
      this.ID,
      this.startdate,
      this.enddate,
      this.starttime,
      this.endtime,
      this.tasktype});
}
