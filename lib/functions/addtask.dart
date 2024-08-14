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
      startdatetime: model.startdatetime,
      enddatetime: model.enddatetime);

  // var box = await Hive.openBox('task');
  print('${model.title} ${model.startdatetime.toString()}');

  // box.put('${model.title} ${model.startdatetime.toString()}', {

  // });

  // box.close();
  // print('${box.get(task)}');
  // print('Task saved to database');
  // print('--------------------------------');
  // print(
  //     '${box.get('${model.title} ${model.startdatetime.toString()}')['name']}');
  // print('');
}
