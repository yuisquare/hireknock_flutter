import 'package:hire_knock/utils/environment.dart';

class AppEndpoints {
  static getBaseUrl() {
    if (Environment.appEnv == 'Dev') {
      // return 'http://localhost:3000';
      // return 'http://192.168.0.7:3000';
      return 'https://hireknock.in/';
    } else {
      return '';
    }
  }

  //onboard
  static String signup = '/onboard/signup';
  static String login = '/onboard/login';
}
