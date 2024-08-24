import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initialNotification(BuildContext context) async {
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: (id, title, body, payload) =>
          myDidReceiveLocalNotification(id, title, body, payload, context),
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: selectNotification,
    );
  }

  Future<void> selectNotification(NotificationResponse notification) async {
    String? payload = notification.payload;
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    // Get.to(() => SecondScreen(payload));
  }

  Future<void> myDidReceiveLocalNotification(int id, String? title,
      String? body, String? payload, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? "Notification"),
        content: Text(body ?? "test"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              // Navigator.of(context, rootNavigator: true).pop();
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeView(payload),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }
}
