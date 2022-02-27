import 'package:flutter/material.dart';

import './tablet_app_bar.dart';
import './desktop_app_bar.dart';

import '../../../core/core.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > DeviceBreakpoints.desktopWidth) {
      return const DesktopAppBar();
    } else if (screenWidth > DeviceBreakpoints.mobileWidth) {
      return const TabletAppBar(isMobile: false);
    } else {
      return const TabletAppBar(isMobile: true);
    }
  }
}
