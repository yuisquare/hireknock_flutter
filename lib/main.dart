import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hire_knock/core/app_services/env_service.dart';
import 'package:hire_knock/core/app_services/navigator_service.dart';
import 'package:hire_knock/controllers/setup_controller/setup_controller.dart';
import 'package:hire_knock/utils/h_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  // await EnvService.toProd();
  await EnvService.toDev();

  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = NavigatorService.appRouter;
  @override
  Widget build(BuildContext context) {
    return _buildMatrialApp();
  }

  Widget _buildMatrialApp() {
    SetupController.initializeApiService();
    // check for saved userData and selected institute
    SetupController.getSavedUserData();
    return MaterialApp.router(
      title: "Hire Knock",
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      scrollBehavior: HScrollBehavior(),
      
    );
  }
}
