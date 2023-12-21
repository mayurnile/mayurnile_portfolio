import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class AllProjectsScreen extends StatelessWidget {
  const AllProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    AllProjectCardType projectCardType;
    TextStyle screenTitleStyle = textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor);

    if (size.width < DeviceBreakpoints.tabletWidth) {
      projectCardType = AllProjectCardType.mobile;
      screenTitleStyle = textTheme.headlineSmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else if (size.width > DeviceBreakpoints.tabletWidth && size.width < DeviceBreakpoints.desktopWidth) {
      projectCardType = AllProjectCardType.tablet;
      screenTitleStyle = textTheme.displaySmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else {
      projectCardType = AllProjectCardType.desktop;
    }

    return VisibilityDetector(
      key: const ValueKey('/all-projects-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 10) {
          locator.get<NavBarController>().updateProjectsNavBarState(ProjectsNavBarState.projects);
        }
      },
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // title
            Text(
              '<projects>',
              style: screenTitleStyle,
            ),
            // spacing
            _buildSpace(projectCardType),
            // projects list
            _buildProjectsList(projectCardType),
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
  Widget _buildSpace(AllProjectCardType type) {
    switch (type) {
      case AllProjectCardType.mobile:
        return const SizedBox(height: 18.0);
      case AllProjectCardType.tablet:
        return const SizedBox(height: 36.0);
      case AllProjectCardType.desktop:
        return const SizedBox(height: 72.0);
    }
  }

  Widget _buildProjectsList(AllProjectCardType type) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allProjectsList.length,
        itemBuilder: (_, index) => AllProjectCard(
          project: allProjectsList[index],
          type: type,
        ),
      );
}
