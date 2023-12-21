import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

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
          style: textTheme.headlineSmall!.copyWith(
            color: AppTheme.ternaryColor,
            fontWeight: FontWeight.bold,
          ),
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
          style: textTheme.headlineSmall!.copyWith(
            color: AppTheme.ternaryColor,
            fontWeight: FontWeight.bold,
          ),
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
              SkillBadgeV2(
                icon: skillsList[0].icon,
                title: skillsList[0].title,
                experience: skillsList[0].experience,
                type: BadgeType.mobile,
              ),
              // Flutter
              SkillBadgeV2(
                icon: skillsList[1].icon,
                title: skillsList[1].title,
                experience: skillsList[1].experience,
                type: BadgeType.mobile,
              ),
              // Flutter
              SkillBadgeV2(
                icon: skillsList[2].icon,
                title: skillsList[2].title,
                experience: skillsList[2].experience,
                type: BadgeType.mobile,
              ),
            ],
          ),
          // spacing
          const SizedBox(height: 16.0),
          // second row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flutter
              SkillBadgeV2(
                icon: skillsList[3].icon,
                title: skillsList[3].title,
                experience: skillsList[3].experience,
                type: BadgeType.mobile,
              ),
              // Flutter
              SkillBadgeV2(
                icon: skillsList[4].icon,
                title: skillsList[4].title,
                experience: skillsList[4].experience,
                type: BadgeType.mobile,
              ),
              // Flutter
              SkillBadgeV2(
                icon: skillsList[5].icon,
                title: skillsList[5].title,
                experience: skillsList[5].experience,
                type: BadgeType.mobile,
              ),
            ],
          ),
        ],
      );

  Widget _buildWorkExperienceList() => Column(
        children: experiencesList
            .map(
              (experience) => ExperienceCard(
                experience: experience,
                type: ExperienceCardType.mobile,
              ),
            )
            .toList(),
      );
}
