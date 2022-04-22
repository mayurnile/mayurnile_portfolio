import 'package:flutter/material.dart';

import '../../../core/core.dart';

import './all_project_card_desktop.dart';
import './all_project_card_tablet.dart';
import './all_project_card_mobile.dart';

enum AllProjectCardType { mobile, tablet, desktop }

class AllProjectCard extends StatelessWidget {
  final Project project;
  final AllProjectCardType type;

  const AllProjectCard({
    Key? key,
    required this.project,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AllProjectCardType.mobile:
        return AllProjectCardMobile(project: project);
      case AllProjectCardType.tablet:
        return AllProjectCardTablet(project: project);
      case AllProjectCardType.desktop:
        return AllProjectCardDesktop(project: project);
    }
  }
}
