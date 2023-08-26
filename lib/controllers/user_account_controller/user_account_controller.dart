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
