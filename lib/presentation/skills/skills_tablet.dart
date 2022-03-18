import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class SkillsTablet extends StatelessWidget {
  const SkillsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // title
        Text(
          '<my skills>',
          style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
        ),
        // spacing
        const SizedBox(height: 32.0),
        // skills list
        _buildSkillsList(),
        // spacing
        const SizedBox(height: 84.0),
        // work experience title
        Text(
          '<my work experience>',
          style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
        ),
        // spacing
        const SizedBox(height: 48.0),
        // experience list
        _buildWorkExperienceList(),
        // spacing
        SizedBox(height: size.height * 0.2),
      ],
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildSkillsList() => Column(
        children: [
          // first row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flutter
              const SkillBadge(
                icon: IconAssets.flutter,
                title: "Flutter",
                type: BadgeType.tablet,
                experience: 2.3,
              ),
              // spacing
              _buildSpacing(),
              // Flutter
              const SkillBadge(
                icon: IconAssets.dart,
                title: "Dart",
                type: BadgeType.tablet,
                experience: 2.3,
              ),
              // spacing
              _buildSpacing(),
              // Flutter
              const SkillBadge(
                icon: IconAssets.firebase,
                title: "Firebase",
                type: BadgeType.tablet,
                experience: 2.0,
              ),
            ],
          ),
          // spacing
          const SizedBox(height: 22.0),
          // second row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flutter
              const SkillBadge(icon: IconAssets.figma, title: "Figma", type: BadgeType.tablet, experience: 1.5),
              // spacing
              _buildSpacing(),
              // Flutter
              const SkillBadge(icon: IconAssets.afterEffects, title: "After Effects", type: BadgeType.tablet, experience: 4.0),
            ],
          ),
        ],
      );

  Widget _buildWorkExperienceList() => Column(
        children: [
          // Digital Trons Experience
          ExperienceCard(
            experience: experiencesList[0],
            color: AppTheme.primaryColor,
            type: ExperienceCardType.tablet,
          ),
          // Outshade Digital Media Experience
          ExperienceCard(
            experience: experiencesList[1],
            color: AppTheme.secondaryColor,
            type: ExperienceCardType.tablet,
          ),
          // OETD Labs Experience
          ExperienceCard(
            experience: experiencesList[2],
            color: AppTheme.ternaryColor,
            type: ExperienceCardType.tablet,
            isLast: true,
          ),
        ],
      );

  Widget _buildSpacing() => const SizedBox(width: 36.0);
}
