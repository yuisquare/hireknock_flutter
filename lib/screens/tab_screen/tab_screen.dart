import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hire_knock/core/app_constants/app_colors.dart';
import 'package:hire_knock/enums/enums.dart';
import 'package:hire_knock/screens/applied_job/applied_job_screen.dart';
import 'package:hire_knock/screens/explore_screen/explore_screen.dart';
import 'package:hire_knock/screens/home/home_screen.dart';
import 'package:hire_knock/screens/profile/profile_screen.dart';
import 'package:hire_knock/widgets/container/h_container.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

@RoutePage()
class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
    this.screen,
  });
  final TabScreens? screen;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<TabScreenData> screens = [
    const TabScreenData(
      screen: TabScreens.HOME,
      name: 'Home',
      icon: Icons.home_rounded,
      view: HomeScreen(),
    ),
    const TabScreenData(
      screen: TabScreens.APPLIED_JOB,
      name: 'Applied Jobs',
      icon: CupertinoIcons.doc_plaintext,
      view: AppliedJobScreen(),
    ),
    const TabScreenData(
      screen: TabScreens.EXPLORE,
      name: 'Explore',
      icon: Icons.explore_outlined,
      view: ExploreScreen(),
    ),
    const TabScreenData(
      screen: TabScreens.PROFILE,
      name: 'Profile',
      icon: CupertinoIcons.person_alt_circle,
      view: ProfileScreen(),
    ),
  ];

  int index = 0;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (widget.screen != null) {
        int newIndex = screens.indexWhere(
          (element) => element.screen == widget.screen,
        );
        if (newIndex != -1) {
          index = newIndex;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabScreens.values.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const HText(
            text: 'HireKnock',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell,
              ),
            ),
            const HContainer(
              height: 30,
              width: 30,
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            HSpace.horizonital(10),
          ],
        ),
        drawer: const Drawer(),
        body: screens[index].view,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.tertiary,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedFontSize: 14,
          selectedFontSize: 14,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          selectedItemColor: AppColor.selected,
          unselectedItemColor: AppColor.unSelected,
          unselectedIconTheme: const IconThemeData(
            color: AppColor.unSelected,
          ),
          selectedIconTheme: const IconThemeData(
            color: AppColor.selected,
          ),
          items: List.generate(screens.length, (index) {
            final TabScreenData screen = screens[index];
            return BottomNavigationBarItem(
              icon: Icon(screen.icon),
              label: screen.name,
            );
          }),
          currentIndex: index,
          onTap: (int newIndex) {
            index = newIndex;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class TabScreenData {
  final TabScreens screen;
  final String name;
  final IconData icon;
  final Widget view;

  const TabScreenData({
    required this.screen,
    required this.name,
    required this.icon,
    required this.view,
  });
}
