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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../screens/error_screen/env_error_screen.dart' as _i6;
import '../screens/home/home_screen.dart' as _i5;
import '../screens/login/login_screen.dart' as _i2;
import '../screens/login/security_check_screen.dart' as _i3;
import '../screens/otp/otp_screen.dart' as _i4;
import '../screens/splash/splash_screen.dart' as _i1;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SecurityCheckScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SecurityCheckScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpScreen.name: (routeData) {
      final args = routeData.argsAs<OtpScreenArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OtpScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          onSubmit: args.onSubmit,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EnvErrorScreen.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.EnvErrorScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginScreen.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          SecurityCheckScreen.name,
          path: '/security_check',
        ),
        _i7.RouteConfig(
          OtpScreen.name,
          path: '/verification',
        ),
        _i7.RouteConfig(
          HomeScreen.name,
          path: '/home',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          EnvErrorScreen.name,
          path: '/env_error',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i7.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i7.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.SecurityCheckScreen]
class SecurityCheckScreen extends _i7.PageRouteInfo<void> {
  const SecurityCheckScreen()
      : super(
          SecurityCheckScreen.name,
          path: '/security_check',
        );

  static const String name = 'SecurityCheckScreen';
}

/// generated route for
/// [_i4.OtpScreen]
class OtpScreen extends _i7.PageRouteInfo<OtpScreenArgs> {
  OtpScreen({
    _i8.Key? key,
    required String phoneNumber,
    required dynamic Function() onSubmit,
  }) : super(
          OtpScreen.name,
          path: '/verification',
          args: OtpScreenArgs(
            key: key,
            phoneNumber: phoneNumber,
            onSubmit: onSubmit,
          ),
        );

  static const String name = 'OtpScreen';
}

class OtpScreenArgs {
  const OtpScreenArgs({
    this.key,
    required this.phoneNumber,
    required this.onSubmit,
  });

  final _i8.Key? key;

  final String phoneNumber;

  final dynamic Function() onSubmit;

  @override
  String toString() {
    return 'OtpScreenArgs{key: $key, phoneNumber: $phoneNumber, onSubmit: $onSubmit}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreen extends _i7.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i6.EnvErrorScreen]
class EnvErrorScreen extends _i7.PageRouteInfo<void> {
  const EnvErrorScreen()
      : super(
          EnvErrorScreen.name,
          path: '/env_error',
        );

  static const String name = 'EnvErrorScreen';
}
