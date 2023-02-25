import 'package:get_storage/get_storage.dart';
import 'package:hire_knock/utils/logger.dart';

class AppStorage {
  static final _box = GetStorage();

  static Future<void> saveData(
      {required String key, required String data}) async {
    try {
      await _box.write(key, data.isNotEmpty ? data : null);
      Logger.success('$key saved');
    } on Exception catch (e) {
      Logger.error(e);
    }
  }

  static Future<void> clear() async {
    try {
      await _box.erase();
      Logger.success('AppStorage cleared');
    } on Exception catch (e) {
      Logger.error(e);
    }
  }

  static Future<void> removeData({required String key}) async {
    try {
      await _box.write(key, null);
      Logger.success('$key removed');
    } on Exception catch (e) {
      Logger.error(e);
    }
  }

  static String? getData(String key) {
    try {
      Logger.success('$key saved');
      return _box.read(key);
    } on Exception catch (e) {
      Logger.error(e);
    }
    return null;
  }
}
