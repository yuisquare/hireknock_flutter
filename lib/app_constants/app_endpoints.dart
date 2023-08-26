import 'package:hire_knock/utils/environment.dart';

class AppEndpoints {
  static getBaseUrl() {
    if (Environment.appEnv == 'Dev') {
      return 'http://localhost:3000';
    } else {
      return '';
    }
  }

  //onboard
  static String signup = '/onboard/signup';
  static String login = '/onboard/login';
}
