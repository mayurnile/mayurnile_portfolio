import 'package:flutter/material.dart';

import './core/core.dart';
import './di/locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayur Nile',
      theme: AppTheme.getAppThemeData(),
      initialRoute: AppRoutes.landingRoute,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}
