import 'package:flutter/material.dart';

import './project_card_desktop.dart';
import './project_card_tablet.dart';
import './project_card_mobile.dart';

enum ProjectCardType { mobile, tablet, desktop }
enum ProjectCardPosition { center, left, right }

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final ProjectCardPosition position;
  final ProjectCardType type;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.position,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ProjectCardType.mobile:
        return ProjectCardMobile(title: title, subtitle: subtitle, image: image, position: position);
      case ProjectCardType.tablet:
        return ProjectCardTablet(title: title, subtitle: subtitle, image: image, position: position);
      case ProjectCardType.desktop:
        return ProjectCardDesktop(title: title, subtitle: subtitle, image: image, position: position);
    }
  }
}
