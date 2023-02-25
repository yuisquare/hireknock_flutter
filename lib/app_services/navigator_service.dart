import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_route/app_router.gr.dart';
import '../app_route/auth_guard.dart';

class NavigatorService {
  static final appRouter = AppRouter(authGuard: AuthGuard());

  static BuildContext context = appRouter.navigatorKey.currentState!.context;

  static Future<dynamic> push(PageRouteInfo<dynamic> route) async {
    return appRouter.navigate(route);
  }

  static Future<dynamic> navigate(PageRouteInfo<dynamic> route) async {
    return appRouter.navigate(route);
  }

  static bool removeLast() {
    return appRouter.removeLast();
  }

  static Future<dynamic> replace(PageRouteInfo<dynamic> route) async {
    return appRouter.replace(route);
  }

  static Future<void> replaceAll(List<PageRouteInfo<dynamic>> routes) async {
    return appRouter.replaceAll(routes);
  }

  static Future<dynamic> back() async {
    return appRouter.navigateBack();
  }

  static Future<dynamic> pop({dynamic data}) async {
    return appRouter.pop();
  }

  static bool canGoBack() {
    return appRouter.canNavigateBack;
  }
}
