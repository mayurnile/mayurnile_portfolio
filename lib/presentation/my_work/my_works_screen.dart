import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    ProjectCardType projectCardType;
    TextStyle screenTitleStyle = textTheme.headline3!.copyWith(color: AppTheme.ternaryColor);

    if (size.width > DeviceBreakpoints.desktopWidth) {
      projectCardType = ProjectCardType.desktop;
    } else if (size.width < DeviceBreakpoints.mobileWidth) {
      projectCardType = ProjectCardType.mobile;
      screenTitleStyle = textTheme.headline5!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else {
      projectCardType = ProjectCardType.tablet;
      screenTitleStyle = textTheme.headline3!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    }

    return VisibilityDetector(
      key: const ValueKey('/my-work-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator.get<NavBarController>().updateNavBarState(NavBarState.mywork);
        }
      },
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title
            Text(
              '<my latest projects>',
              style: screenTitleStyle,
            ),
            // spacing
            _buildSpace(projectCardType),
            // projects list
            _buildProjectsList(projectCardType),
            // spacing
            SizedBox(height: size.height * 0.1),
            // view all projects button
            AppButton(
              onPressed: () => locator.get<NavigationService>().pushNamed(AppRoutes.allProjectsRoute),
              borderColor: AppTheme.secondaryColor,
              title: 'View All Projects',
              isSmall: projectCardType != ProjectCardType.desktop,
            ),
            // spacing
            SizedBox(height: size.height * 0.2),
          ],
        ),
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildSpace(ProjectCardType type) {
    switch (type) {
      case ProjectCardType.mobile:
        return const SizedBox(height: 18.0);
      case ProjectCardType.tablet:
        return const SizedBox(height: 36.0);
      case ProjectCardType.desktop:
        return const SizedBox(height: 72.0);
    }
  }

  Widget _buildProjectsList(ProjectCardType type) => Column(
        children: [
          // Flylady Project
          ProjectCard(
            project: projectsList[0],
            position: ProjectCardPosition.center,
            type: type,
          ),
          // spacing
          const SizedBox(height: 72.0),
          // Sacred Groves Project
          ProjectCard(
            project: projectsList[1],
            position: ProjectCardPosition.left,
            type: type,
          ),
          // spacing
          const SizedBox(height: 72.0),
          // Procom Project
          ProjectCard(
            project: projectsList[2],
            position: ProjectCardPosition.right,
            type: type,
          ),
        ],
      );
}
