import 'package:flutter/material.dart';

import '../core/core.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String previousRoute = AppRoutes.landingRoute;
  String currentRoute = AppRoutes.landingRoute;

  Future<dynamic> pushNamed(
    String routeName, {
    Map<String, dynamic> arguments = const {},
  }) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacement(
    String routeName, {
    Map<String, dynamic> arguments = const {},
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> removeAllAndPush(
    String routeName, {
    Map<String, dynamic> arguments = const {},
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> popUntil(
    String routeName, {
    Map<String, dynamic> arguments = const {},
  }) async {
    navigatorKey.currentState!.popUntil((_currentRoute) {
      final bool result = _currentRoute.settings.name == routeName;
      if (result) {
        final String tempRoute = currentRoute;
        currentRoute = routeName;
        previousRoute = tempRoute;
      }
      return result;
    });
  }

  void pop({bool resetColor = true}) {
    final String tempRoute = currentRoute;
    currentRoute = previousRoute;
    previousRoute = tempRoute;
    return navigatorKey.currentState!.pop();
  }

  /// Setters
  ///
  ///

  /// Set the current route and previous route
  /// based on the navigation
  set currentRouteName(String routeName) {
    previousRoute = currentRoute;
    currentRoute = routeName;
  }

  /// Getters
  ///
  ///

  /// Returns current route name
  String get currentRouteName => currentRoute;
}
