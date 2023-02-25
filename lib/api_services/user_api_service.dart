import 'package:hire_knock/models/user_data/user_data.dart';

class UserApiService {
  static Future<UserData?> fetchUserData({
    required String userId,
  }) async {
    return null;
  }

  static Future<void> createUserData({
    required String userId,
  }) async {}
  static Future<bool> updateUserData({
    required String userId,
    String? notificationToken,
  }) async {
    return false;
  }

  static Future<void> deleteUserData({
    required String userId,
  }) async {}
}
