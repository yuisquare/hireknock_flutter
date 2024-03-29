import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:hire_knock/core/app_route/app_router.dart';
import 'package:hire_knock/controllers/auth_controller/auth_controller.dart';

final _authController = Get.put(AuthController());

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    bool isAuthenticated = _authController.isLoggedIn();
    if (isAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.navigate(const LoginRoute());
    }
  }
}
