import 'package:flutter/material.dart';

import './project_card.dart';

import '../../../core/core.dart';

class ProjectCardMobile extends StatelessWidget {
  final Project project;
  final ProjectCardPosition position;

  const ProjectCardMobile({
    Key? key,
    required this.project,
    required this.position,
  }) : super(key: key);

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

    return Transform.translate(
      offset: offsetWidget,
      child: SizedBox(
        height: size.height * 0.45,
        width: size.width * 0.65,
        child: Stack(
          children: [
            // decorated border
            _buildDecorationBorder(),
            // image
            _buildImage(),
            // image opacity filter
            _buildImageFilters(),
            // app details
            _buildAppDetails(size, textTheme),
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

  Widget _buildAppDetails(Size size, TextTheme textTheme) => Positioned(
        left: size.width * 0.02,
        right: size.width * 0.1,
        bottom: size.height * 0.07,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app name
            Text(
              project.title,
              style: textTheme.headline4!.copyWith(fontFamily: 'Josefin Sans'),
            ),
            // spacing
            const SizedBox(height: 8.0),
            // description
            Text(
              project.subtitle,
              style: textTheme.bodyText2!.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // spacing
            const SizedBox(height: 12.0),
            // store links
            Wrap(
              runSpacing: 12.0,
              children: [
                // play store
                if (project.playStoreLink != null)
                  ElevatedButton(
                    onPressed: () => Utils.openURL(project.playStoreLink!),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    ),
                    child: const Text('Play Store'),
                  ),
                // spacing
                if (project.playStoreLink != null) const SizedBox(width: 16.0),
                // papp store
                if (project.appStoreLink != null)
                  ElevatedButton(
                    onPressed: () => Utils.openURL(project.appStoreLink!),
                    style: ElevatedButton.styleFrom(
                      primary: AppTheme.ternaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    ),
                    child: const Text('App Store'),
                  ),
              ],
            ),
          ],
        ),
      );
}
