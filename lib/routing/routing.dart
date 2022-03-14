import 'package:flutter/material.dart';

import '../core/core.dart';

import './routing_animations.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // performing routing to appropriate screen
  switch (settings.name) {
    case AppRoutes.landingRoute:
      return getPageRoute(const LandingScreen(), settings);
    default:
      return getPageRoute(const LandingScreen(), settings);
  }
}
