// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:taskapp_work/Notifction/Notification_services.dart';
// import 'dart:convert';
// // import 'notification_service.dart';

// class starttime extends GetxController {
//   var startTimes = <DateTime>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadStartTimes();
//     NotificationService().init();
//   }

//   void addStartTime(DateTime startTime) {
//     startTimes.add(startTime);
//     saveStartTimes();
//     scheduleNotification(startTime);
//   }

//   void loadStartTimes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? startTimesString = prefs.getString('startTimes');
//     if (startTimesString != null) {
//       List<dynamic> jsonList = jsonDecode(startTimesString);
//       startTimes.value = jsonList.map((json) => DateTime.parse(json)).toList();
//     }
//   }

//   void saveStartTimes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> jsonList =
//         startTimes.map((time) => time.toIso8601String()).toList();
//     prefs.setString('startTimes', jsonEncode(jsonList));
//   }

//   void scheduleNotification(DateTime startTime) {
//     DateTime now = DateTime.now();
//     Duration difference = startTime.difference(now);
//     if (difference.isNegative) return;

//     Future.delayed(difference, () {
//       NotificationService().showNotification(
//         startTime.hashCode,
//         'Task Started',
//         'Your task has started.',
//       );
//     });
//   }
// }
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:taskapp_work/Notifction/Notification_services.dart';
// import 'notification_service.dart';

class TasktimeController extends GetxController {
  var tasks = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
    NotificationService().init();
  }

  void addTask(DateTime startTime, String title, String description) {
    tasks.add(
        {'startTime': startTime, 'title': title, 'Description': description});
    saveTasks();
    scheduleNotification(startTime, title, description);
  }

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      List<dynamic> jsonList = jsonDecode(tasksString);
      tasks.value =
          jsonList.map((json) => json as Map<String, dynamic>).toList();
    }
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = tasks.map((task) => jsonEncode(task)).toList();
    prefs.setString('tasks', jsonEncode(jsonList));
  }

  void scheduleNotification(
      DateTime startTime, String title, String Description) {
    DateTime now = DateTime.now();
    Duration difference = startTime.difference(now);
    if (difference.isNegative) return;

    Future.delayed(difference, () {
      NotificationService().showNotification(
        startTime.hashCode,
        title,
        '$Description',
      );
    });
  }
}
