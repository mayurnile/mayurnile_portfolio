import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import './core/core.dart';
import './di/locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  setPathUrlStrategy();
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayur Nile',
      theme: AppTheme.getAppThemeData(),
      initialRoute: AppRoutes.splashRoute,
      navigatorKey: di.locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}
