import 'dart:convert';

import 'package:hire_knock/app_constants/app_endpoints.dart';
import 'package:hire_knock/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'package:hire_knock/models/user_data/user_data.dart';

class OnboardApiService {
  static Future<UserData?> signup({
    required String fullName,
    required String email,
    required String password,
    required String mobileNo,
    required String? linkedinUrl,
  }) async {
    Map<String, dynamic> payload = {
      'fullname': fullName,
      'email': email,
      'password': password,
      'mobile_no': mobileNo,
    };
    if (linkedinUrl != null) payload['linkedin_link'] = linkedinUrl;
    try {
      http.Response response = await http.post(
        Uri.parse(AppEndpoints.getBaseUrl() + AppEndpoints.signup),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Logger.success('signup successfull');
        var result = jsonDecode(response.body);
        UserData user = UserData.fromJson(result['resultSet']);
        return user;
      }
    } catch (e) {
      Logger.error(e);
    }
    return null;
  }

  static Future<UserData?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> payload = {
      'email': email,
      'password': password,
    };
    try {
      http.Response response = await http.post(
        Uri.parse(AppEndpoints.getBaseUrl() + AppEndpoints.login),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        Logger.success('Login successfull');
        var result = jsonDecode(response.body);
        Map<String, dynamic> json = result['resultSet'];
        UserData user = UserData.fromJson(json);
        return user;
      } else {
        Logger.error('Login failed');
      }
    } catch (e) {
      Logger.error('Login error:: $e');
    }
    return null;
  }
}
