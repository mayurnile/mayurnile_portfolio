import 'package:flutter/material.dart';

import '../widgets.dart';

import '../../../core/core.dart';

class AllProjectCardDesktop extends StatelessWidget {
  final Project project;

  const AllProjectCardDesktop({
    required this.project,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Project Image
            _buildImage(size),
            // spacing
            const SizedBox(width: 42.0),
            // project details
            _buildAppDescription(size, textTheme)
          ],
        ),
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildImage(Size size) => SizedBox(
        height: size.height * 0.35,
        width: size.width * 0.3,
        child: Image.asset(
          project.image,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildAppDescription(Size size, TextTheme textTheme) {
    return SizedBox(
      width: size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // project number
          Text(
            project.projectNumber,
            style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
          ),
          // spacing
          const SizedBox(height: 8.0),
          // project name
          Text(
            project.title,
            style: textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
          ),
          // project details
          Container(
            width: size.width * 0.25,
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            padding: const EdgeInsets.all(12.0),
            color: AppTheme.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: project.description
                  .map(
                    (String bulletPoint) => BulletPoint(text: bulletPoint),
                  )
                  .toList(),
            ),
          ),
          // store links
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // play store
              if (project.playStoreLink != null)
                ElevatedButton(
                  onPressed: () => Utils.openURL(project.playStoreLink!),
                  style: ElevatedButton.styleFrom(primary: AppTheme.secondaryColor),
                  child: const Text('Play Store'),
                ),
              // spacing
              if (project.playStoreLink != null) const SizedBox(width: 16.0),
              // app store
              if (project.appStoreLink != null)
                ElevatedButton(
                  onPressed: () => Utils.openURL(project.appStoreLink!),
                  style: ElevatedButton.styleFrom(primary: AppTheme.ternaryColor),
                  child: const Text('App Store'),
                ),
              // github link
              if (project.githubLink != null)
                ElevatedButton(
                  onPressed: () => Utils.openURL(project.githubLink!),
                  style: ElevatedButton.styleFrom(primary: AppTheme.secondaryColor),
                  child: const Text('Github'),
                ),
              // spacing
              if (project.githubLink != null) const SizedBox(width: 16.0),
              // figma link
              if (project.figmaLink != null)
                ElevatedButton(
                  onPressed: () => Utils.openURL(project.figmaLink!),
                  style: ElevatedButton.styleFrom(primary: AppTheme.ternaryColor),
                  child: const Text('Figma'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
