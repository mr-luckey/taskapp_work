// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:taskapp_work/boxes/boxes.dart';
// import 'package:taskapp_work/models/taskModel.dart';

// class TaskController extends GetxController {
//   var completedTasks = <taskModel>[].obs;
//   var pendingTasks = <taskModel>[].obs;
//   var ongoingTasks = <taskModel>[].obs;
//   var canceledTasks = <taskModel>[].obs;

//   /// The commented out code block you provided is an overridden method in the `TaskController` class in
//   /// Dart. The `onInit()` method is a lifecycle method provided by the GetX package in Flutter. It is
//   /// called when the controller is initialized.

//   // @override
//   // void onInit() {
//   //   super.onInit();
//   //   // fetchTasks();
//   // }

//   // void fetchTasks() {
//   //   var allTasks = Boxes.getData().values.toList().cast<taskModel>();
//   //   completedTasks.value =
//   //       allTasks.where((task) => task.tasktype == 'Completed').toList();
//   //   pendingTasks.value =
//   //       allTasks.where((task) => task.tasktype == 'Pending').toList();
//   //   ongoingTasks.value =
//   //       allTasks.where((task) => task.tasktype == 'On_Going').toList();
//   //   canceledTasks.value =
//   //       allTasks.where((task) => task.tasktype == 'Canceled').toList();
//   // }

//   // void updateTaskType(taskModel task, String newType) {
//   //   task.tasktype = newType;
//   //   task.save();
//   //   fetchTasks(); // Refresh the lists
//   // }
// }
