import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ExperienceCardMobile extends StatelessWidget {
  final Experience experience;

  const ExperienceCardMobile({
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
          const SizedBox(width: 16.0),
          // experience details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // company name
              Text(
                experience.companyName,
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              // spacing
              const SizedBox(height: 4.0),
              // position
              Text(
                experience.jobTitle,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              // tenure
              Text(
                experience.tenure,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              // spacing
              const SizedBox(height: 12.0),
              // job description
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  experience.description,
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
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
          Transform.translate(
            offset: const Offset(0.0, 0.0),
            child: Text(
              "//",
              style: textTheme.headlineMedium!.copyWith(
                  fontFamily: 'Space Grotesk', color: experience.color),
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
            child: FittedBox(
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
}
