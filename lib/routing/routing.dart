import 'package:flutter/material.dart';

import '../core/core.dart';

import './routing_animations.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // performing routing to appropriate screen
  switch (settings.name) {
    case AppRoutes.splashRoute:
      return getSlidePageRoute(const SplashScreen(), settings);
    case AppRoutes.landingRoute:
      locator.get<NavBarController>().isNavigatedFromSplash = true;
      locator.get<NavBarController>().update();
      return getSlidePageRoute(const LandingScreen(), settings);
    case AppRoutes.allProjectsRoute:
      locator.get<NavBarController>().isNavigatedFromSplash = true;
      locator.get<NavBarController>().update();
      return getSlidePageRoute(const ProjectsScreen(), settings);
    default:
      return getSlidePageRoute(const SplashScreen(), settings);
  }
}
