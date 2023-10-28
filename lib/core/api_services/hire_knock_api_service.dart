
import 'package:hire_knock/utils/environment.dart';
import 'package:hire_knock/utils/logger.dart';


class HireKnockApiService {
  static Future<void> init({
    required String appEnv,
  }) async {
    Environment.appEnv = appEnv;
  }

  static bool isInitialized() {
    bool isAllGood = true;

    // App env name check
    if (Environment.appEnv.isEmpty) {
      Logger.error('App env name setup');
      isAllGood = false;
    } else {
      Logger.success('App env name setup');
    }

    return isAllGood;
  }
}
