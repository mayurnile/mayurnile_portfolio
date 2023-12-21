import 'package:flutter/material.dart';

import './tablet_projects_app_bar.dart';
import './desktop_projects_app_bar.dart';

import '../../../core/core.dart';

class ProjectsAppBar extends StatelessWidget {
  const ProjectsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > DeviceBreakpoints.desktopWidth) {
      return const DesktopProjectsAppBar();
    } else if (screenWidth > DeviceBreakpoints.mobileWidth) {
      return const TabletProjectsAppBar(isMobile: false);
    } else {
      return const TabletProjectsAppBar(isMobile: true);
    }
  }
}
