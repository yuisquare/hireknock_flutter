import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hire_knock/api_services/user_api_service.dart';
import 'package:hire_knock/app_constants/app_loader.dart';
import 'package:hire_knock/app_constants/app_storage.dart';
import 'package:hire_knock/app_services/push_notification_service.dart';
import 'package:hire_knock/models/user_data/user_data.dart';
import 'package:hire_knock/utils/logger.dart';


class UserAccountController extends GetxController {
  Rx<UserData?> userData = Rx<UserData?>(null);

  void fetchLoggedInUserData() async {
    AppLoader.show(title: 'Fethcing user data');
    userData.value =
        await UserApiService.fetchUserData(userId: userData.value?.uid ?? 'No_Uid');
    AppLoader.close();
  }

  Future<void> updateToken() async {
    if (!kIsWeb) {
      Logger.info('updating token');
      // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
      // final token = await _fcm.getToken();
      var notification = PushNotificationService();
      String? token = await notification.getToken();

      if (userData.value != null &&
          userData.value?.uid != null &&
          token != null) {
        if (userData.value?.notificationToken == null ||
            userData.value?.notificationToken != token) {
          bool isUpdated = await UserApiService.updateUserData(
            userId: userData.value?.uid ?? '',
            notificationToken: token,
          );
          if (isUpdated) {
            Logger.info('Token updated');
            UserData user = userData.value!;
            userData.value = user.copyWith(
              notificationToken: token,
            );
          }
        }
      }
    }
  }

  void selectUser(UserData user) {
    userData = user.obs;
    update(['profile']);
    AppStorage.saveData(key: 'userData', data: jsonEncode(user));
  }


  bool isLoggedIn() {
    if (userData.value != null) {
      return true;
    }
    return false;
  }
}
