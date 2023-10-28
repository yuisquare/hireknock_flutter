import 'package:get/get.dart';
import 'package:hire_knock/api_services/hire_knock_api_service.dart';
import 'package:hire_knock/controllers/auth_controller/auth_controller.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import '../../app_route/app_router.dart';
import '../../app_services/navigator_service.dart';

final _authController = Get.put(AuthController());
final _userController = Get.put(UserAccountController());

class SplashController {
  static void isApiInitialized() async {
    // await _authController.checkForUpdate();
    bool isInitialized = HireKnockApiService.isInitialized();
    await Future.delayed(Duration(seconds: 1));
    if (isInitialized) {
      if (_authController.isLoggedIn()) {
        if (_userController.userData.value != null) {
          // NavigatorService.replaceAll([SecurityCheckScreen()]);
          NavigatorService.replaceAll([TabRoute()]);
        } else {
          // NavigatorService.replaceAll([SignupScreen()]);
        }
      } else {
        NavigatorService.replaceAll([const LoginRoute()]);
      }
    } else {
      NavigatorService.replaceAll([const EnvErrorRoute()]);
    }
  }
}
