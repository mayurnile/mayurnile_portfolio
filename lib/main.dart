import 'package:flutter/material.dart';

import './core/core.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayur Nile Portfolio',
      theme: AppTheme.getAppThemeData(),
      home: const LandingScreen(),
    );
  }
}
