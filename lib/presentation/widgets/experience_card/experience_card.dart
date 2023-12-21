import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'experience_card_desktop.dart';
import 'experience_card_mobile.dart';
import 'experience_card_tablet.dart';

enum ExperienceCardType { mobile, tablet, desktop }

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  final ExperienceCardType type;

  const ExperienceCard({
    super.key,
    required this.experience,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ExperienceCardType.mobile:
        return ExperienceCardMobile(experience: experience);
      case ExperienceCardType.tablet:
        return ExperienceCardTablet(experience: experience);
      case ExperienceCardType.desktop:
        return ExperienceCardDesktop(experience: experience);
    }
  }
}
