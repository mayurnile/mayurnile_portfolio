import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ExperimentCardTablet extends StatelessWidget {
  final Project project;

  const ExperimentCardTablet({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Utils.openURL(project.packageLink!),
      child: Container(
        height: size.width * 0.25,
        width: size.width * 0.4,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 32.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppTheme.secondaryColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // package logo
            SvgPicture.asset(IconAssets.dart),
            // package type
            Text('Flutter Package', style: textTheme.subtitle1!.copyWith(fontFamily: 'Victor Mono')),
            // spacing
            const SizedBox(height: 12.0),
            // package title
            Text(
              project.title,
              style: textTheme.headline4,
            ),
            // spacing
            const SizedBox(height: 8.0),
            // package description
            Text(
              project.subtitle,
              style: textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
