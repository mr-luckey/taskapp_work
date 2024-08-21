import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> notify(NotificationResponse notificationRes) async {}

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: notify,
        onDidReceiveNotificationResponse: notify);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> showNotification(int hashCode, String title,
      [String? body]) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      additionalFlags: Int32List.fromList(<int>[4]), // To show action buttons
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      body,
      platformChannelSpecifics,
      payload: 'cancel_task',
    );
  }

  static void backgroundNotificationHandler(SendPort sendPort) {
    final ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((message) async {
      final int hashCode = message[0];
      final String title = message[1];
      final String? body = message[2];

      final NotificationService notificationService = NotificationService();
      await notificationService.showNotification(hashCode, title, body);
    });
  }

  void startBackgroundNotification() {
    final ReceivePort receivePort = ReceivePort();
    Isolate.spawn(backgroundNotificationHandler, receivePort.sendPort);

    receivePort.listen((sendPort) {
      final SendPort isolateSendPort = sendPort as SendPort;
      isolateSendPort
          .send([0, 'Background Task', 'This is a background notification']);
    });
  }
}
