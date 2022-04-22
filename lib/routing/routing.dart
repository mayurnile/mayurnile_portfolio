import 'package:flutter/material.dart';

import '../core/core.dart';

import './routing_animations.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // performing routing to appropriate screen
  switch (settings.name) {
    case AppRoutes.splashRoute:
      return getSlidePageRoute(const SplashScreen(), settings);
    case AppRoutes.landingRoute:
      return getSlidePageRoute(const LandingScreen(), settings);
    case AppRoutes.allProjectsRoute:
      return getSlidePageRoute(const ProjectsScreen(), settings);
    default:
      return getSlidePageRoute(const SplashScreen(), settings);
  }
}
