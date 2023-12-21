import 'package:flutter/material.dart';

import './project_card.dart';

import '../../../core/core.dart';

class ProjectCardTablet extends StatelessWidget {
  final Project project;
  final ProjectCardPosition position;

  const ProjectCardTablet({
    super.key,
    required this.project,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    // Calculating widget offset
    Offset offsetWidget;
    switch (position) {
      case ProjectCardPosition.center:
        offsetWidget = Offset.zero;
        break;
      case ProjectCardPosition.left:
        offsetWidget = Offset(-size.width * 0.05, 0.0);
        break;
      case ProjectCardPosition.right:
        offsetWidget = Offset(size.width * 0.05, 0.0);
        break;
    }

    // Calculating Widget Size
    double height = size.height * 0.35;
    double width = size.width * 0.5;
    bool showLargeFont = false;

    if (size.width > DeviceBreakpoints.mobileWidth && size.width < DeviceBreakpoints.maxTabletWidth) {
      height = size.height * 0.4;
      width = size.width * 0.6;
    } else {
      showLargeFont = true;
    }

    return Transform.translate(
      offset: offsetWidget,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            // decorated border
            _buildDecorationBorder(),
            // image
            _buildImage(),
            // image opacity filter
            _buildImageFilters(),
            // app details
            _buildAppDetails(size, textTheme, showLargeFont),
          ],
        ),
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildDecorationBorder() => Positioned(
        left: 18.0,
        top: 18.0,
        right: 0.0,
        bottom: 0.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppTheme.secondaryColor,
            ),
          ),
        ),
      );

  Widget _buildImage() => Positioned(
        left: 0.0,
        top: 0.0,
        right: 18.0,
        bottom: 18.0,
        child: Image.asset(
          project.image,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildImageFilters() => Positioned(
        left: 0.0,
        top: 0.0,
        right: 18.0,
        bottom: 18.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor.withOpacity(0.7),
          ),
        ),
      );

  Widget _buildAppDetails(Size size, TextTheme textTheme, bool largeFont) => Positioned(
        left: size.width * 0.02,
        right: size.width * 0.1,
        bottom: size.height * 0.07,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app name
            Text(
              project.title,
              style: textTheme.displaySmall!.copyWith(fontFamily: 'Josefin Sans'),
            ),
            // spacing
            const SizedBox(height: 8.0),
            // description
            Text(
              project.subtitle,
              style: textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w300,
              ),
            ),
            // spacing
            const SizedBox(height: 12.0),
            // store links
            Row(
              children: [
                // play store
                if (project.playStoreLink != null)
                  ElevatedButton(
                    onPressed: () => Utils.openURL(project.playStoreLink!),
                    child: const Text('Play Store'),
                  ),
                // spacing
                if (project.playStoreLink != null) const SizedBox(width: 16.0),
                // app store
                if (project.appStoreLink != null)
                  ElevatedButton(
                    onPressed: () => Utils.openURL(project.appStoreLink!),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.ternaryColor),
                    child: const Text('App Store'),
                  ),
              ],
            ),
          ],
        ),
      );
}
