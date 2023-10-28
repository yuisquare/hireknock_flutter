import 'dart:convert';

import 'package:get/get.dart';
import 'package:hire_knock/api_services/hire_knock_api_service.dart';
import 'package:hire_knock/app_constants/app_storage.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hire_knock/models/user_data/user_data.dart';
import 'package:hire_knock/utils/logger.dart';

class SetupController {
  static final userAccountController = Get.put(UserAccountController());

  static void initializeApiService() {
    HireKnockApiService.init(
      
      appEnv: dotenv.env['APP_ENV'] ?? '',
    );
  }

  static void getSavedUserData() {
    Logger.info('Searching saved user data');
    String? userData = AppStorage.getData('userData');
    if (userData != null) {
      Logger.info('Found saved user data');
      try {
        UserData data = UserData.fromJson(jsonDecode(userData));
        userAccountController.userData.value = data;
        Logger.success('Attached user data to the user account controller');
      } on Exception catch (e) {
        Logger.error(e);
      }
    }
  }
}
