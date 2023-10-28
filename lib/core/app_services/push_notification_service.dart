import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hire_knock/core/app_services/app_local_notification.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/utils/logger.dart';

class PushNotificationService {
  final userController = Get.put(UserAccountController());
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    Logger.success('PushNotificationService Initialized');
    AppLocalNotification.initialize();
    notificationHandler();
  }

  void notificationHandler() {
    //when app killed and opened
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      AppLocalNotification.handleNotificationClick(jsonEncode(message?.data));
    });
    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger.info('foreground app');
      AppLocalNotification.display(message);
    });

    //opened and minimized
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      Logger.info('notification clicked onMessageOpenedApp');
      AppLocalNotification.handleNotificationClick(jsonEncode(message?.data));
    });
  }

  Future<String?> getToken() async {
    Logger.info('getToken: ');
    try {
      _fcm.requestPermission(sound: true, badge: true, alert: true);
      String? token = await _fcm.getToken();
      Logger.success('Token Fetched');
      return token;
    } on Exception {
      return null;
    }
  }
}
