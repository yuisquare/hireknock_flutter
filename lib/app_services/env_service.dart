import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hire_knock/utils/logger.dart';

class EnvService {
  static Future<void> toProd() async {
    await dotenv.load(fileName: '.env.prod');
    Logger.success('Env set to production');
  }

  static Future<void> toDev() async {
    await dotenv.load(fileName: '.env.dev');
    Logger.success('Env set to development');
  }
}
