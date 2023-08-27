import 'package:auto_route/auto_route.dart';
import 'package:hire_knock/app_route/auth_guard.dart';
import 'package:hire_knock/screens/error_screen/env_error_screen.dart';
import 'package:hire_knock/screens/home/home_screen.dart';
import 'package:hire_knock/screens/login/login_screen.dart';
import 'package:hire_knock/screens/login/security_check_screen.dart';
import 'package:hire_knock/screens/otp/otp_screen.dart';
import 'package:hire_knock/screens/splash/splash_screen.dart';


@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.noTransition,
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen, path: '/login'),
    AutoRoute(page: SecurityCheckScreen, path: '/security_check'),
    AutoRoute(page: OtpScreen, path: '/verification'),
    AutoRoute(
        page: HomeScreen,
        path: '/home',
        guards: [AuthGuard]),

    // error screens
    AutoRoute(page: EnvErrorScreen, path: '/env_error'),
  ],
)
class $AppRouter {}
