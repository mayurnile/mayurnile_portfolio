import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class ExperimentsScreen extends StatelessWidget {
  const ExperimentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    ExperimentCardType projectCardType;
    TextStyle screenTitleStyle = textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor);

    if (size.width < DeviceBreakpoints.tabletWidth) {
      projectCardType = ExperimentCardType.mobile;
      screenTitleStyle = textTheme.headlineSmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else if (size.width > DeviceBreakpoints.tabletWidth && size.width < DeviceBreakpoints.desktopWidth) {
      projectCardType = ExperimentCardType.tablet;
      screenTitleStyle = textTheme.displaySmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else {
      projectCardType = ExperimentCardType.desktop;
    }

    return VisibilityDetector(
      key: const ValueKey('/experiments-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator.get<NavBarController>().updateProjectsNavBarState(ProjectsNavBarState.experiments);
        }
      },
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title
            Text(
              '<experiments>',
              style: screenTitleStyle,
            ),
            // spacing
            _buildSpace(projectCardType),
            // experiments list
            _buildExperimentsList(projectCardType, size),
            // spacing
            SizedBox(height: size.height * 0.2),
            // footer
            const WebsiteFooter(),
            // spacing
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildSpace(ExperimentCardType type) {
    switch (type) {
      case ExperimentCardType.mobile:
        return const SizedBox(height: 18.0);
      case ExperimentCardType.tablet:
        return const SizedBox(height: 36.0);
      case ExperimentCardType.desktop:
        return const SizedBox(height: 72.0);
    }
  }

  Widget _buildExperimentsList(ExperimentCardType type, Size size) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: experimentsList.map((experiment) => ExperimentCard(project: experiment, type: type)).toList(),
      );
}
