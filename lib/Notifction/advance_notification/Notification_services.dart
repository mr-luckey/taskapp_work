// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // class NotificationService {
// //   static final NotificationService _notificationService =
// //       NotificationService._internal();

// //   factory NotificationService() {
// //     return _notificationService;
// //   }

// //   NotificationService._internal();

// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   Future<void> init() async {
// //     final AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');

// //     final InitializationSettings initializationSettings =
// //         InitializationSettings(android: initializationSettingsAndroid);

// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }

// //   Future<void> showNotification(int id, String title, String body) async {
// //     const AndroidNotificationDetails androidPlatformChannelSpecifics =
// //         AndroidNotificationDetails('your_channel_id', 'your_channel_name',
// //             importance: Importance.high,
// //             priority: Priority.high,
// //             showWhen: false);
// //     const NotificationDetails platformChannelSpecifics =
// //         NotificationDetails(android: androidPlatformChannelSpecifics);
// //     await flutterLocalNotificationsPlugin.show(
// //         id, title, body, platformChannelSpecifics);
// //   }
// // }
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class AdvanceNotificationService {
//   static final AdvanceNotificationService _notificationService =
//       AdvanceNotificationService._internal();

//   factory AdvanceNotificationService() {
//     return _notificationService;
//   }

//   AdvanceNotificationService._internal();

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> showNotification(int id, String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('your_channel_id', 'your_channel_name',
//             importance: Importance.max,
//             priority: Priority.high,
//              actions: <AndroidNotificationAction>[
//       AndroidNotificationAction('action_1', 'Action 1'),
//       AndroidNotificationAction('action_2', 'Action 2'),
//     ],
//             showWhen: false);
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         id, title, body, platformChannelSpecifics);
//   }
// }
