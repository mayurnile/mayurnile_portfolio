import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum NavBarState { home, skills, mywork, contact }

class NavBarController extends GetxController {
  // global keys
  final GlobalKey homeGlobalKey = GlobalKey();
  final GlobalKey skillsGlobalKey = GlobalKey();
  final GlobalKey myWorkGlobalKey = GlobalKey();
  final GlobalKey contactGlobalKey = GlobalKey();

  // scroll controller
  late ScrollController scrollController;

  // data variables 
  NavBarState navBarState = NavBarState.home;

  /// [Method for updating nav bar state]
  ///
  ///
  void updateNavBarState(NavBarState state) {
    navBarState = state;
    update();
  }
}
