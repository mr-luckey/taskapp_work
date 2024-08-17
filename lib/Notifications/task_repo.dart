import 'package:hive/hive.dart';
import 'package:taskapp_work/models/taskModel.dart';
import 'package:taskapp_work/boxes/boxes.dart';

class TaskRepository {
  Future<List<taskModel>> getTasksForNotification() async {
    var box = Boxes.getData();
    var data = box.values.toList().cast<taskModel>();

    // Get the current time and format it to match the task start time
    var now = DateTime.now().toLocal().toString();
    print("printing time and date to match");
    // print()
    print(now);
    var formattedNow = now.toString();
    print(formattedNow); // YYYY-MM-DD format

    return data.where((task) {
      // Check if the start time matches the current time
      return task.startdate == formattedNow && task.starttime == now.toString();
    }).toList();
  }
}
