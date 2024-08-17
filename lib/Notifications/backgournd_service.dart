// import 'package:workmanager/workmanager.dart';
// import 'task_repository.dart';
import 'package:taskapp_work/Notifications/task_repo.dart';
import 'package:workmanager/workmanager.dart';

import 'notification_service.dart';

void callbackDispatcher() {
  print("you called me?");
  Workmanager().executeTask((task, inputData) async {
    var repository = TaskRepository();
    var notificationService = NotificationService();

    var tasks = await repository.getTasksForNotification();

    for (var task in tasks) {
      print("notification show call");
      await notificationService.showNotification(
        'Task Reminder',
        'Time to start task: ${task.title}',
      );
    }

    return Future.value(true);
  });
}

class BackgroundService {
  static void initialize() {
    Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask(
      '5',
      'simplePeriodicTask',
      frequency: Duration(seconds: 1),
    );
  }
}
