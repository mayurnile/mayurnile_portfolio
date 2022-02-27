import 'package:flutter/material.dart';

import './home_mobile.dart';
import './home_tablet.dart';
import './home_desktop.dart';

import '../../core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > tabletWidth) {
      return const HomeDesktop();
    } else if (screenWidth > mobileWidth && screenWidth < tabletWidth) {
      return const HomeTablet();
    } else {
      return const HomeMobile();
    }
  }
}
