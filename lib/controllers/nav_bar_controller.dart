import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/core.dart';

enum NavBarState { home, skills, mywork, contact }

enum ProjectsNavBarState { projects, experiments }

class NavBarController extends GetxController {
  // global keys for home
  final GlobalKey homeGlobalKey = GlobalKey();
  final GlobalKey skillsGlobalKey = GlobalKey();
  final GlobalKey myWorkGlobalKey = GlobalKey();
  final GlobalKey contactGlobalKey = GlobalKey();

  // global keys for projects
  final GlobalKey allProjectsGlobalKey = GlobalKey();
  final GlobalKey experimentsGlobalKey = GlobalKey();

  // scroll controller
  late ScrollController landingScreenScrollController;
  late ScrollController projectsScreenScrollController;

  // data variables
  bool isNavigatedFromSplash = false;
  NavBarState navBarState = NavBarState.home;
  ProjectsNavBarState projectsNavBarState = ProjectsNavBarState.projects;

  /// [Method for updating nav bar state]
  ///
  ///
  void navigateToLandingScreen() {
    if (isNavigatedFromSplash == false) {
      Future.delayed(const Duration(seconds: 3)).then(
        (_) {
          isNavigatedFromSplash = true;
          update();
          return locator.get<NavigationService>().removeAllAndPush(AppRoutes.landingRoute);
        },
      );
    }
  }

  void updateNavBarState(NavBarState state) {
    navBarState = state;
    update();
  }

  void updateProjectsNavBarState(ProjectsNavBarState state) {
    projectsNavBarState = state;
    update();
  }
}
