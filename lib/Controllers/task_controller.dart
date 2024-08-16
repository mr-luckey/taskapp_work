import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/models/taskModel.dart';

class TaskController extends GetxController {
  var completedTasks = [].obs;
  var pendingTasks = [].obs;
  var ongoingTasks = [].obs;
  var cancelTasks = [].obs;

  RxInt completedCount = 0.obs;
  RxInt pendingCount = 0.obs;
  RxInt ongoingCount = 0.obs;
  RxInt cancelCount = 0.obs;

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
        .toList();
    pendingTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'Pending')
        .toList();
    ongoingTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'On_Going')
        .toList();
    cancelTasks.value = Boxes.getData()
        .values
        .toList()
        .cast<taskModel>()
        .where((task) => task.tasktype == 'Canceled')
        .toList();

    completedCount.value = completedTasks.length;
    pendingCount.value = pendingTasks.length;
    ongoingCount.value = ongoingTasks.length;
    cancelCount.value = cancelTasks.length;
  }
}
