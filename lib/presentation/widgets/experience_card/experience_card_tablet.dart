import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ExperienceCardTablet extends StatelessWidget {
  final Experience experience;

  const ExperienceCardTablet({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // experience number
          _buildExperienceNumber(size, textTheme),
          // spacing
          const SizedBox(width: 32.0),
          // experience details
          SizedBox(
            width: size.width * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // company name
                Text(
                  experience.companyName,
                  style: textTheme.displaySmall,
                ),
                // spacing
                const SizedBox(height: 4.0),
                // position and tenure
                _buildPositionAndTenure(size, textTheme),
                // spacing
                const SizedBox(height: 12.0),
                // job description
                Text(
                  experience.description,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildExperienceNumber(Size size, TextTheme textTheme) => Row(
        children: [
          SizedBox(
            width: size.width * 0.02,
            child: FittedBox(
              child: Transform.translate(
                offset: const Offset(0.0, 4.0),
                child: Text(
                  "//",
                  style: textTheme.displaySmall!.copyWith(
                      fontFamily: 'Space Grotesk', color: experience.color),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.055,
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              child: Text(
                experience.number,
                style: textTheme.displayLarge!.copyWith(
                  fontFamily: 'Space Grotesk',
                  color: experience.color,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildPositionAndTenure(Size size, TextTheme textTheme) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // position
          SizedBox(
            width: size.width * 0.3,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                experience.jobTitle,
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // tenure
          SizedBox(
            width: size.width * 0.25,
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Text(
                experience.tenure,
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
}
