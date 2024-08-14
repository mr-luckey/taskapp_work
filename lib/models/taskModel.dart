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
  String? startdatetime;
  @HiveField(6)
  String? enddatetime;
  @HiveField(7)
  String? tasktype;

  taskModel(
      {this.title,
      this.description,
      this.status,
      required this.tags,
      this.ID,
      this.startdatetime,
      this.enddatetime,
      this.tasktype});
}
  // taskModel.fromMap(Map<String, dynamic> json) {
  //   title = json['title'];

  //   description = json['description'];
  //   status = json['status'];
  //   tags = json['tags'];
  //   ID = json['ID'];
  //   startdatetime = json['startdatetime'];
  //   enddatetime = json['enddatetime'];
  //   tasktype = json['tasktype'];
  // }

//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['status'] = this.status;
//     data['tags'] = this.tags;

//     data['ID'] = this.ID;
//     data['startdatetime'] = this.startdatetime;
//     data['enddatetime'] = this.enddatetime;
//     data['tasktype'] = this.tasktype;
//     return data;
//   }
// }
