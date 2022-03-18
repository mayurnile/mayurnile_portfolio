import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return VisibilityDetector(
      key: const ValueKey('/skills-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator.get<NavBarController>().updateNavBarState(NavBarState.skills);
        }
      },
      child: Column(
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
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildSkillsList() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flutter
          const SkillBadge(
            icon: IconAssets.flutter,
            title: "Flutter",
            type: BadgeType.desktop,
            experience: 2.3,
          ),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(
            icon: IconAssets.dart,
            title: "Dart",
            type: BadgeType.desktop,
            experience: 2.3,
          ),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(
            icon: IconAssets.firebase,
            title: "Firebase",
            type: BadgeType.desktop,
            experience: 2.0,
          ),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(
            icon: IconAssets.figma,
            title: "Figma",
            type: BadgeType.desktop,
            experience: 1.5,
          ),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(
            icon: IconAssets.afterEffects,
            title: "After Effects",
            type: BadgeType.desktop,
            experience: 4.0,
          ),
        ],
      );

  Widget _buildWorkExperienceList() => Column(
        children: [
          // Digital Trons Experience
          ExperienceCard(
            experience: experiencesList[0],
            color: AppTheme.primaryColor,
            type: ExperienceCardType.desktop,
          ),
          // Outshade Digital Media Experience
          ExperienceCard(
            experience: experiencesList[1],
            color: AppTheme.secondaryColor,
            type: ExperienceCardType.desktop,
          ),
          // OETD Labs Experience
          ExperienceCard(
            experience: experiencesList[2],
            color: AppTheme.ternaryColor,
            type: ExperienceCardType.desktop,
            isLast: true,
          ),
        ],
      );

  Widget _buildSpacing() => const SizedBox(width: 42.0);
}
