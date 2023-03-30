import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //ios working
  static void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    print("Im printedededed ${body} and title ${title}");
  }

  static void initialize(context) {
    // initializationSettings for Android
    InitializationSettings initializationSettings =
        const InitializationSettings(
      // iOS: IOSInitializationSettings(
      //   requestAlertPermission: true,
      //   requestBadgePermission: true,
      //   requestSoundPermission: true,
      //   onDidReceiveLocalNotification: onDidReceiveLocalNotification
      // ),
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    /// TODO initialize method
    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (route) async {
      log("onSelectNotification");
      if (route == null) {
        Get.to(route);

        log("Router Value: $route");

        //////// DemoScreen in case of Foreground Message ///////////////////
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => DemoScreen(id: id)),
        // );
        ////////////////////////////////////////////////////////////////////
      }
    });
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "flutter_push_notification_app",
          "flutter_push_notification_app",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      /// pop up show
      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],

        //////// In case of DemoScreen //////////////////////////////////////
        // this "id" key and "id" key of passing firebase's data must same
        // payload: message.data["_id"],
        ////////////////////////////////////////////////////////////////////
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
