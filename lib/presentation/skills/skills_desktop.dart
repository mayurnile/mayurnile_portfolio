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
          const SkillBadge(icon: IconAssets.flutter, title: "Flutter", type: BadgeType.desktop, skillLevel: 8.0),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(icon: IconAssets.dart, title: "Dart", type: BadgeType.desktop, skillLevel: 6.0),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(icon: IconAssets.firebase, title: "Firebase", type: BadgeType.desktop, skillLevel: 7.0,),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(icon: IconAssets.figma, title: "Figma", type: BadgeType.desktop, skillLevel: 7.0),
          // spacing
          _buildSpacing(),
          // Flutter
          const SkillBadge(icon: IconAssets.afterEffects, title: "After Effects", type: BadgeType.desktop, skillLevel: 5.0),
        ],
      );

  Widget _buildWorkExperienceList() => Column(
        children: const [
          // Digital Trons Experience
          ExperienceCard(
            companyName: 'Digital Trons',
            tenure: 'Jul 2021 - Present',
            jobTitle: 'Sr. Flutter Developer',
            description: 'Lorem ipsum...',
            color: AppTheme.primaryColor,
            type: ExperienceCardType.desktop,
          ),
          // Outshade Digital Media Experience
          ExperienceCard(
            companyName: 'Outshade Digital Media',
            tenure: 'May 2020 - Jun 2021',
            jobTitle: 'Flutter Developer & UI/UX Designer',
            description: 'Lorem ipsum...',
            color: AppTheme.secondaryColor,
            type: ExperienceCardType.desktop,
          ),
          // OETD Labs Experience
          ExperienceCard(
            companyName: 'OETD Labs',
            tenure: 'Dec 2019 - Apr 2020',
            jobTitle: 'Flutter Developer',
            description: 'Lorem ipsum...',
            color: AppTheme.ternaryColor,
            type: ExperienceCardType.desktop,
            isLast: true,
          ),
        ],
      );

  Widget _buildSpacing() => const SizedBox(width: 42.0);
}
