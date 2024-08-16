import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/models/taskModel.dart';
import 'package:get/get.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/models/taskModel.dart';

class DailozTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var tasksForToday = <taskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() {
    var box = Boxes.getData();
    var data = box.values.toList().cast<taskModel>();
    tasksForToday.value = data.where((task) {
      return task.startdate ==
          selectedDate.value.toLocal().toString().split(' ')[0];
    }).toList();
    update();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    fetchTasks();
  }
}

class TaskController extends GetxController {
  var completedTasks = 0.obs;
  var pendingTasks = 0.obs;
  var ongoingTasks = 0.obs;
  var cancelTasks = 0.obs;

  // var completedCount = 0.obs;
  // var pendingCount = 0.obs;
  // var ongoingCount = 0.obs;
  // RxInt cancelCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() {
    completedTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'Completed')
        .toList()
        .length;
    pendingTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'Pending')
        .toList()
        .length;
    ongoingTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'On_Going')
        .toList()
        .length;
    cancelTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'Canceled')
        .toList()
        .length;
  }
}
