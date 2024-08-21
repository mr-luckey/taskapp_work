// // ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskapp_work/Notifction/Notification_services.dart';
import 'package:taskapp_work/boxes/boxes.dart';
// import 'package:taskapp_work/Notifications/Notification_service.dart';
import 'package:taskapp_work/models/taskModel.dart';
// import 'package:taskapp_work/test/testscreen.dart';
import 'package:workmanager/workmanager.dart';

import 'dailoz/dailoz_page/dailoz_Authentication/dailoz_splashscreen.dart';
import 'dailoz/dailoz_theme/dailoz_theme.dart';
import 'dailoz/dailoz_theme/dailoz_themecontroller.dart';
import 'dailoz/dailoz_translation/stringtranslation.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  tz.initializeTimeZones();
  final NotificationService notificationService = NotificationService();
  // await notificationService.init();
  WidgetsFlutterBinding.ensureInitialized();
  notificationService.startBackgroundNotification();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) async {
      if (response.payload != null) {
        handleNotificationAction(response.payload!);
      }
    },
  );

  // await NotificationServices.initialize();
  // await NotificationService.initilize();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(taskModelAdapter());
  Hive.openBox<taskModel>('task');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> handleNotificationAction(String payload) async {
  if (payload == 'cancel_task') {
    print("start working////////////////////");
    // var box = await Hive.openBox<TaskModel>('tasks');
    var boxx = Boxes.getData();
    var data = boxx.values.toList().cast<taskModel>();
    var pendingTasks = data
        .where((task) =>
            task.tasktype == 'Pending' && task.starttime == DateTime.now())
        .toList();
    pendingTasks.forEach((element) {
      element.tasktype = 'Cancelled';
      element.save();
      print("start complete saved working////////////////////");
    });
  } else if (payload == 'action_2') {
    print('Action 2 pressed');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DailozThemecontroler());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata.isdark
          ? DailozMythemes.darkTheme
          : DailozMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: DailozApptranslation(),
      locale: const Locale('en', 'US'),
      home:
          //  HourlyTasksScreen()
          const DailozSplashscreen(),
    );
  }
}
