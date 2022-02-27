import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // title
        Text(
          '<my latest projects>',
          style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
        ),
        // spacing
        const SizedBox(height: 72.0),
        // projects list
        _buildProjectsList(),
        // spacing
        SizedBox(height: size.height * 0.1),
        // view all projects button
        AppButton(
          onPressed: () {},
          borderColor: AppTheme.secondaryColor,
          title: 'View All Projects',
        ),
        // spacing
        SizedBox(height: size.height * 0.2),
      ],
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildProjectsList() => Column(
        children: const [
          // Flylady Project
          ProjectCard(
            title: 'FlyLady Plus',
            subtitle: 'Declutter and clean your home the way that millions of other ladies have !',
            image: ImageAssets.flyladyBanner,
            position: ProjectCardPosition.center,
          ),
          // spacing
          SizedBox(height: 72.0),
          // Sacred Groves Project
          ProjectCard(
            title: 'Sacred Groves',
            subtitle: 'A platform to initate a motive that being, to save 25 million hectares of forest lands and inculcate nature reverence.',
            image: ImageAssets.sacredGrovesBanner,
            position: ProjectCardPosition.left,
          ),
          // spacing
          SizedBox(height: 72.0),
          // Flylady Project
          ProjectCard(
            title: 'Procom Smart Home',
            subtitle: 'A home automation app collated with Flutter, Firebase and MongoDB and implemented the design within 25 days of onboarding the project.',
            image: ImageAssets.procomBanner,
            position: ProjectCardPosition.right,
          ),
        ],
      );
}
