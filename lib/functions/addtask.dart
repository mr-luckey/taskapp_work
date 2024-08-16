import 'package:hive/hive.dart';
import 'package:taskapp_work/models/taskModel.dart';

void savetasktodatabase(taskModel model) async {
  final task = taskModel(
      title: model.title,
      ID: model.ID,
      tasktype: model.tasktype,
      description: model.description,
      status: model.status,
      tags: model.tags,
      starttime: model.starttime,
      startdate: model.startdate,
      enddate: model.enddate,
      endtime: model.endtime);
}
