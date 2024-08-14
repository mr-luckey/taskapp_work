import 'package:hive/hive.dart';
import 'package:taskapp_work/models/taskModel.dart';

class Boxes {
  static Box<taskModel> getData() => Hive.box<taskModel>('task');
}
