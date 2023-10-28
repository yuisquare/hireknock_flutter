import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hire_knock/app_route/auth_guard.dart';
import 'package:hire_knock/enums/enums.dart';
import 'package:hire_knock/screens/error_screen/env_error_screen.dart';
import 'package:hire_knock/screens/home/home_screen.dart';
import 'package:hire_knock/screens/login/login_screen.dart';
import 'package:hire_knock/screens/login/security_check_screen.dart';
import 'package:hire_knock/screens/otp/otp_screen.dart';
import 'package:hire_knock/screens/splash/splash_screen.dart';
import 'package:hire_knock/screens/tab_screen/tab_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        _getRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        _getRoute(page: LoginRoute.page, path: '/login'),
        _getRoute(page: TabRoute.page),
        _getRoute(
            page: SecurityCheckRoute.page,
            path: '/security-check',
            guards: [AuthGuard()]),
        _getRoute(
            page: OtpRoute.page,
            path: '/otp-check',
            guards: [AuthGuard()]),


        // error Route.pages
        _getRoute(page: EnvErrorRoute.page, path: '/env_error'),
      ];
}

AutoRoute _getRoute({
  required PageInfo<dynamic> page,
  bool initial = false,
  String? path,
  List<AutoRouteGuard> guards = const [],
}) {
  return CustomRoute(
    page: page,
    initial: initial,
    path: path,
    guards: guards,
    transitionsBuilder: TransitionsBuilders.noTransition,
  );
}
