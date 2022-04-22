import 'package:flutter/material.dart';

import '../../../core/core.dart';

import './experiment_card_desktop.dart';
import './experiment_card_tablet.dart';
import './experiment_card_mobile.dart';

enum ExperimentCardType { mobile, tablet, desktop }

class ExperimentCard extends StatelessWidget {
  final Project project;
  final ExperimentCardType type;

  const ExperimentCard({
    Key? key,
    required this.project,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ExperimentCardType.mobile:
        return ExperimentCardMobile(project: project);
      case ExperimentCardType.tablet:
        return ExperimentCardTablet(project: project);
      case ExperimentCardType.desktop:
        return ExperimentCardDesktop(project: project);
    }
  }
}
