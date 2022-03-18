import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../core/core.dart';

class ExperienceCardTablet extends StatelessWidget {
  final Experience experience;
  final Color color;
  final bool isLast;

  const ExperienceCardTablet({
    Key? key,
    required this.experience,
    required this.color,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // company name and tenure
        _buildCompanyDetails(size, textTheme),
        // spacing
        const SizedBox(width: 32.0),
        // timeline marker
        _buildTimelineMarker(size),
        // spacing
        const SizedBox(width: 32.0),
        // job title and description
        _buildJobTitleAndDescription(size, textTheme),
      ],
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildCompanyDetails(Size size, TextTheme textTheme) => SizedBox(
        width: size.width * 0.27,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // company name
            AutoSizeText(
              experience.companyName,
              textAlign: TextAlign.end,
              style: textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
              maxLines: 2,
            ),
            // spacing
            const SizedBox(height: 8.0),
            // tenture
            FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Text(
                experience.tenure,
                style: textTheme.headline4!.copyWith(color: AppTheme.fontLightColor),
              ),
            ),
          ],
        ),
      );

  Widget _buildTimelineMarker(Size size) => SizedBox(
        width: size.width * 0.05,
        child: Column(
          children: [
            // center dot
            DottedBorder(
              strokeWidth: 2.0,
              dashPattern: const [4, 8, 4, 8],
              color: Colors.white,
              borderType: BorderType.Circle,
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 22.0,
                width: 22.0,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
            ),
            // dotted line
            if (!isLast)
              DashedLine(
                color: Colors.white,
                gap: 6.0,
                heightContainer: size.height * 0.12,
              ),
          ],
        ),
      );

  Widget _buildJobTitleAndDescription(Size size, TextTheme textTheme) => SizedBox(
        width: size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // company name
            AutoSizeText(
              experience.jobTitle,
              style: textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
              maxLines: 3,
              minFontSize: 12.0,
            ),
            // spacing
            const SizedBox(height: 12.0),
            // tenture
            AutoSizeText(
              experience.description,
              style: textTheme.bodyText2,
              maxLines: 5,
            ),
          ],
        ),
      );
}

class DashedLine extends StatelessWidget {
  final double gap;
  final double heightContainer;
  final Color color;

  const DashedLine({
    Key? key,
    this.gap = 3,
    this.color = Colors.black,
    this.heightContainer = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightContainer,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          const dashWidth = 2.0;
          final dashHeight = gap;
          final dashCount = (boxHeight / (2 * dashHeight)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
          );
        },
      ),
    );
  }
}
