import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hire_knock/app_constants/app_colors.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/utils/logger.dart';

final userController = Get.find<UserAccountController>();

class AppLocalNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() async {
    if (kIsWeb) return;
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@drawable/ic_notification"),
            iOS: DarwinInitializationSettings(
              requestAlertPermission: true,
              defaultPresentSound: true,
            ));

    await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse? response) async {
      Logger.info('notification clicked local');
      if (response != null) {
        handleNotificationClick(response.payload ?? '');
      }
    });
  }

  static void display(RemoteMessage message) async {
    if (kIsWeb) return;
    try {
      var android = AndroidNotificationDetails(
        "quizly",
        "Quizly",
        importance: Importance.max,
        priority: Priority.high,
        color: AppColor.secondary,
        styleInformation: const BigTextStyleInformation(''),
      );

      var iOS = const DarwinNotificationDetails();

      final NotificationDetails notificationDetails =
          NotificationDetails(android: android, iOS: iOS);

      await _notificationsPlugin.show(
        message.hashCode,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    } on Exception catch (e) {
      Logger.error(e.toString());
    }
  }

  static void handleNotificationClick(String data) async {
    if (kIsWeb) return;
    var jsonData = jsonDecode(data);
    if (jsonData == null) return;
    String? route = jsonData['route_name'];
    if (route != null) {
      switch (route) {
        case 'viewResult':
          Logger.info('Check Student Answersheet');
      }
    }
  }
}
