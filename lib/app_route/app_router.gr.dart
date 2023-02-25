// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/error_screns/env_error_screen.dart' as _i4;
import '../screens/home/home_screen.dart' as _i3;
import '../screens/login/login_screen.dart' as _i2;
import '../screens/splash/splash_screen.dart' as _i1;
import 'auth_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i5.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
        transitionsBuilder: _i5.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        transitionsBuilder: _i5.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EnvErrorScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.EnvErrorScreen(),
        transitionsBuilder: _i5.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          LoginScreen.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          HomeScreen.name,
          path: '/home',
          guards: [authGuard],
        ),
        _i5.RouteConfig(
          EnvErrorScreen.name,
          path: '/env_error',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i4.EnvErrorScreen]
class EnvErrorScreen extends _i5.PageRouteInfo<void> {
  const EnvErrorScreen()
      : super(
          EnvErrorScreen.name,
          path: '/env_error',
        );

  static const String name = 'EnvErrorScreen';
}
