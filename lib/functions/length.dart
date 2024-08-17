import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/models/taskModel.dart';

var box = Boxes.getData();
List<taskModel> tasks = box.values.toList().cast<taskModel>();
int getEventTasksCount(List<taskModel> tasks) {
  var eventTasks = tasks.where((task) {
    return task.tags.contains('Event');
  }).toList();
  return eventTasks.length;
}

int getHomeTasksCount(List<taskModel> tasks) {
  var homeTasks = tasks.where((task) {
    return task.tags.contains('Home');
  }).toList();
  return homeTasks.length;
}

int getMeetingTasksCount(List<taskModel> tasks) {
  var meetingTasks = tasks.where((task) {
    return task.tags.contains('Meeting');
  }).toList();
  return meetingTasks.length;
}

int getOfficeTasksCount(List<taskModel> tasks) {
  var officeTasks = tasks.where((task) {
    return task.tags.contains('Office');
  }).toList();
  return officeTasks.length;
}

int getWorkTasksCount(List<taskModel> tasks) {
  var workTasks = tasks.where((task) {
    return task.tags.contains('Work');
  }).toList();
  return workTasks.length;
}

int getUrgentTasksCount(List<taskModel> tasks) {
  var urgentTasks = tasks.where((task) {
    return task.tags.contains('Urgent');
  }).toList();
  return urgentTasks.length;
}
