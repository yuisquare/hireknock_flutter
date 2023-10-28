import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hire_knock/core/app_services/navigator_service.dart';

class AppSize {
  static Size mobileSize = const Size(360, 800);
  static Size largeSize = const Size(1440, 1024);

  static double deviceWidth =
      MediaQuery.of(NavigatorService.context).size.width;
  static double deviceHeight =
      MediaQuery.of(NavigatorService.context).size.height;

      static bool isMobile = Get.width < 650;
}
