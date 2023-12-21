import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

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
          // const SectionTitle(title: '<my skills>', index: 1),
          Text(
            '<my skills>',
            style: textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor),
          ),
          // spacing
          const SizedBox(height: 32.0),
          // skills list
          _buildSkillsList(),
          // spacing
          const SizedBox(height: 84.0),
          // work experience title
          // const SectionTitle(title: '<my work experience>', index: 2),
          Text(
            '<my work experience>',
            style: textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor),
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
        children: skillsList
            .map(
              (skill) => SkillBadgeV2(
                title: skill.title,
                icon: skill.icon,
                experience: skill.experience,
                type: BadgeType.desktop,
              ),
            )
            .toList(),
      );

  Widget _buildWorkExperienceList() => Column(
        children: experiencesList
            .map(
              (experience) => ExperienceCard(
                experience: experience,
                type: ExperienceCardType.desktop,
              ),
            )
            .toList(),
      );
}
