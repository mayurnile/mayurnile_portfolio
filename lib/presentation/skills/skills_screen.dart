import 'package:flutter/material.dart';

import './skills_mobile.dart';
import './skills_tablet.dart';
import './skills_desktop.dart';

import '../../core/core.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > DeviceBreakpoints.desktopWidth) {
      return const SkillsDesktop();
    } else if (screenWidth < DeviceBreakpoints.mobileWidth) {
      return const SkillsMobile();
    } else {
      return const SkillsTablet();
    }
  }
}
