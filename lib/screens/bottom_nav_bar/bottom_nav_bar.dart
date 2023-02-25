library app_bar_screen.dart;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/app_constants/app_colors.dart';
import 'package:hire_knock/controllers/auth_controller/auth_controller.dart';
import 'package:hire_knock/controllers/user_account_controller/user_account_controller.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

import '../../enums/nav_pages.dart';
import '../../widgets/container/h_container.dart';

part 'nav_bar_mobile.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key, required this.selectedPage}) : super(key: key);

  final MobileNavPage? selectedPage;

  final List<MobileNavPage> pages = [
    MobileNavPage.home,
    MobileNavPage.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return _BottomNavBarMobile(
        pages: pages,
        selectedPage: selectedPage,
      );
  }
}
