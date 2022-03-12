import 'package:flutter/material.dart';

import './project_card.dart';

import '../../../core/core.dart';

class ProjectCardTablet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final ProjectCardPosition position;

  const ProjectCardTablet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    // Calculating widget offset
    Offset _offsetWidget;
    switch (position) {
      case ProjectCardPosition.center:
        _offsetWidget = Offset.zero;
        break;
      case ProjectCardPosition.left:
        _offsetWidget = Offset(-size.width * 0.05, 0.0);
        break;
      case ProjectCardPosition.right:
        _offsetWidget = Offset(size.width * 0.05, 0.0);
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
      offset: _offsetWidget,
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
          image,
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
              title,
              style: textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
            ),
            // spacing
            const SizedBox(height: 8.0),
            // description
            Text(
              subtitle,
              style: textTheme.headline4!.copyWith(
                color: Colors.white,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w300,
              ),
            ),
            // spacing
            const SizedBox(height: 12.0),
            // store links
            Row(
              children: [
                // play store
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Play Store'),
                ),
                // spacing
                const SizedBox(width: 16.0),
                // papp store
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: AppTheme.ternaryColor),
                  child: const Text('App Store'),
                ),
              ],
            ),
          ],
        ),
      );
}
