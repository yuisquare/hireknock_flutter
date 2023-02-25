part of app_bar_screen.dart;

class _BottomNavBarMobile extends StatelessWidget {
  _BottomNavBarMobile({
    Key? key,
    required this.pages,
    required this.selectedPage,
  }) : super(key: key);

  final MobileNavPage? selectedPage;
  final List<MobileNavPage> pages;

  String getPageName(MobileNavPage page) {
    switch (page) {
      case MobileNavPage.settings:
        return 'Settings';
      case MobileNavPage.home:
        return 'Home';
    }
  }

  IconData getPageIcon(MobileNavPage page) {
    switch (page) {
      case MobileNavPage.home:
        return Icons.home_filled;
      case MobileNavPage.settings:
        return Icons.settings;
    }
  }

  void goToPage(MobileNavPage page) {
    switch (page) {
      case MobileNavPage.home:
        break;
      case MobileNavPage.settings:
        break;
    }
  }

  final userAccountController = Get.put(UserAccountController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return HContainer(
      padding: EdgeInsets.symmetric(vertical: 5),
      border: Border(top: BorderSide(color: Colors.black.withOpacity(0.2))),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          pages.length,
          (index) {
            return _buildNavItem(
              page: pages[index],
              icon: getPageIcon(pages[index]),
              label: getPageName(pages[index]),
              isSelected: selectedPage == pages[index],
              onTap: () {
                goToPage(pages[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    MobileNavPage? page,
    required bool isSelected,
    required Function() onTap,
  }) {
    return Expanded(
      child: Center(
        child: InkWell(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        color: isSelected ? AppColor.highlight : Colors.black,
                      ),
                      HText(
                        text: label,
                        fontSize: 10,
                        color: isSelected ? AppColor.highlight : Colors.black,
                        fontWeight: FontWeight.bold,
                        isHeader: true,
                      ),
                    ],
                  ),
                  // GetBuilder<UserAccountController>(
                  //     id: 'pendingIcon',
                  //     builder: (controller) {
                  //       if (page != null &&
                  //           page == MobileNavPage.more &&
                  //           userAccountController.isTeacherPending.value)
                  //         return QContainer(
                  //           margin: EdgeInsets.only(left: 5),
                  //           color: Colors.red,
                  //           height: 10,
                  //           width: 10,
                  //           shape: BoxShape.circle,
                  //         );
                  //       if (page != null &&
                  //           page == MobileNavPage.more &&
                  //           userAccountController.isStudentPending.value)
                  //         return QContainer(
                  //           margin: EdgeInsets.only(left: 5),
                  //           color: Colors.red,
                  //           height: 10,
                  //           width: 10,
                  //           shape: BoxShape.circle,
                  //         );
                  //       return Offstage();
                  //     }),
                ],
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
