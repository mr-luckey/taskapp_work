// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskapp_work/Notifications/backgournd_service.dart';
import 'package:taskapp_work/models/taskModel.dart';
import 'package:taskapp_work/test/testscreen.dart';
import 'package:workmanager/workmanager.dart';

import 'dailoz/dailoz_page/dailoz_Authentication/dailoz_splashscreen.dart';
import 'dailoz/dailoz_theme/dailoz_theme.dart';
import 'dailoz/dailoz_theme/dailoz_themecontroller.dart';
import 'dailoz/dailoz_translation/stringtranslation.dart';

Future<void> main() async {
  BackgroundService.initialize();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  WidgetsFlutterBinding.ensureInitialized();

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
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NotificationDemo(),
//     );
//   }
// }

// class NotificationDemo extends StatefulWidget {
//   @override
//   _NotificationDemoState createState() => _NotificationDemoState();
// }

// class _NotificationDemoState extends State<NotificationDemo> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) async {
//         // Handle notification tapped logic here
//       },
//     );
//   }

//   Future<void> _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Dummy Title',
//       'This is a dummy notification body',
//       platformChannelSpecifics,
//       payload: 'Dummy Payload',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Demo'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _showNotification,
//           child: Text('Show Notification'),
//         ),
//       ),
//     );
//   }
// }
