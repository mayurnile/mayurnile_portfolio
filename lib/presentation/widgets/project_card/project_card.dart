import 'package:flutter/material.dart';

import '../../../core/core.dart';

import './project_card_desktop.dart';
import './project_card_tablet.dart';
import './project_card_mobile.dart';

enum ProjectCardType { mobile, tablet, desktop }
enum ProjectCardPosition { center, left, right }

class ProjectCard extends StatelessWidget {
  final Project project;
  final ProjectCardPosition position;
  final ProjectCardType type;

  const ProjectCard({
    super.key,
    required this.project,
    required this.position,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ProjectCardType.mobile:
        return ProjectCardMobile(project: project, position: position);
      case ProjectCardType.tablet:
        return ProjectCardTablet(project: project, position: position);
      case ProjectCardType.desktop:
        return ProjectCardDesktop(project: project, position: position);
    }
  }
}
