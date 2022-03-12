import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum NavBarState { home, skills, mywork, contact }

class NavBarController extends GetxController {
  // data variables
  NavBarState navBarState = NavBarState.home;

  // global keys
  final GlobalKey homeGlobalKey = GlobalKey();
  final GlobalKey skillsGlobalKey = GlobalKey();
  final GlobalKey myWorkGlobalKey = GlobalKey();
  final GlobalKey contactGlobalKey = GlobalKey();

  // scroll controller
  late ScrollController scrollController;

  /// [Method for updating nav bar state]
  ///
  ///
  void updateNavBarState(NavBarState state) {
    navBarState = state;
    update();
  }
}
