import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentai/GetX/other_controllers.dart';
import 'package:mentai/Screens/HomeScreen/home_screen.dart';
import 'package:mentai/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarActivity extends StatefulWidget {
  const NavbarActivity({super.key});

  @override
  State<NavbarActivity> createState() => _NavbarActivityState();
}

class _NavbarActivityState extends State<NavbarActivity> {
  final OtherController _otherController =
      Get.put(OtherController(), permanent: false);

  List<Widget> _buildScreens() {
    return [const HomeScreen(), const ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      navBarItem(CupertinoIcons.home, "Home"),
      navBarItem(CupertinoIcons.profile_circled, "Profile"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _otherController.setTopPadding(MediaQuery.of(context).padding.top);

    return PersistentTabView(
      context,
      controller: _otherController.navBarController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  navBarItem(IconData icon, String title) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: (title.toString()),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }
}
