import 'package:flutter/material.dart';

import './experience_card_desktop.dart';
import './experience_card_tablet.dart';
import './experience_card_mobile.dart';

enum ExperienceCardType { mobile, tablet, desktop }

class ExperienceCard extends StatelessWidget {
  final String companyName;
  final String tenure;
  final String jobTitle;
  final String description;
  final Color color;
  final bool isLast;
  final ExperienceCardType type;

  const ExperienceCard({
    Key? key,
    required this.companyName,
    required this.tenure,
    required this.jobTitle,
    required this.description,
    required this.color,
    required this.type,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ExperienceCardType.mobile:
        return ExperienceCardMobile(
          companyName: companyName,
          tenure: tenure,
          jobTitle: jobTitle,
          description: description,
          color: color,
          isLast: isLast,
        );
      case ExperienceCardType.tablet:
        return ExperienceCardTablet(
          companyName: companyName,
          tenure: tenure,
          jobTitle: jobTitle,
          description: description,
          color: color,
          isLast: isLast,
        );
      case ExperienceCardType.desktop:
        return ExperienceCardDesktop(
          companyName: companyName,
          tenure: tenure,
          jobTitle: jobTitle,
          description: description,
          color: color,
          isLast: isLast,
        );
    }
  }
}
