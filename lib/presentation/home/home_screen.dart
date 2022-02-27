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

    if (screenWidth > DeviceBreakpoints.desktopWidth) {
      return const HomeDesktop();
    } else if (screenWidth < DeviceBreakpoints.mobileWidth) {
      return const HomeMobile();
    } else {
      return const HomeTablet();
    }
  }
}
