// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EnvErrorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EnvErrorScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          onSubmit: args.onSubmit,
        ),
      );
    },
    SecurityCheckRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecurityCheckScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TabRoute.name: (routeData) {
      final args =
          routeData.argsAs<TabRouteArgs>(orElse: () => const TabRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TabScreen(
          key: args.key,
          screen: args.screen,
        ),
      );
    },
  };
}

/// generated route for
/// [EnvErrorScreen]
class EnvErrorRoute extends PageRouteInfo<void> {
  const EnvErrorRoute({List<PageRouteInfo>? children})
      : super(
          EnvErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnvErrorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    required String phoneNumber,
    required dynamic Function() onSubmit,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            onSubmit: onSubmit,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const PageInfo<OtpRouteArgs> page = PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.onSubmit,
  });

  final Key? key;

  final String phoneNumber;

  final dynamic Function() onSubmit;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber, onSubmit: $onSubmit}';
  }
}

/// generated route for
/// [SecurityCheckScreen]
class SecurityCheckRoute extends PageRouteInfo<void> {
  const SecurityCheckRoute({List<PageRouteInfo>? children})
      : super(
          SecurityCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityCheckRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabScreen]
class TabRoute extends PageRouteInfo<TabRouteArgs> {
  TabRoute({
    Key? key,
    TabScreens? screen,
    List<PageRouteInfo>? children,
  }) : super(
          TabRoute.name,
          args: TabRouteArgs(
            key: key,
            screen: screen,
          ),
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static const PageInfo<TabRouteArgs> page = PageInfo<TabRouteArgs>(name);
}

class TabRouteArgs {
  const TabRouteArgs({
    this.key,
    this.screen,
  });

  final Key? key;

  final TabScreens? screen;

  @override
  String toString() {
    return 'TabRouteArgs{key: $key, screen: $screen}';
  }
}
