import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum TestimonialCardType { mobile, tablet, desktop }

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  final TestimonialCardType type;
  final double cardWidth;
  final double cardHeight;

  const TestimonialCard({
    super.key,
    required this.testimonial,
    required this.type,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmall = type == TestimonialCardType.mobile;

    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // testimonial given by
          Text(
            testimonial.givenBy,
            style: isSmall ? textTheme.headlineMedium!.copyWith(fontFamily: 'Josefin Sans') : textTheme.displaySmall!.copyWith(fontFamily: 'Josefin Sans'),
          ),
          // spacing
          const SizedBox(height: 4.0),
          // company name
          Text(
            testimonial.companyName,
            style: isSmall
                ? textTheme.titleMedium!.copyWith(
                    color: AppTheme.secondaryColor,
                    fontFamily: 'Victor Mono',
                    fontWeight: FontWeight.bold,
                  )
                : textTheme.bodyMedium!.copyWith(
                    color: AppTheme.secondaryColor,
                    fontFamily: 'Victor Mono',
                    fontWeight: FontWeight.bold,
                  ),
          ),
          // spacing
          const SizedBox(height: 14.0),
          // testimonial
          Expanded(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // inverted comma
                  Text(
                    "\" ",
                    style: isSmall
                        ? textTheme.displaySmall!.copyWith(
                            fontFamily: 'Space Grotesk',
                            color: Colors.white54,
                            height: 0.7,
                          )
                        : textTheme.displayLarge!.copyWith(
                            fontFamily: 'Space Grotesk',
                            color: Colors.white54,
                            height: 0.7,
                          ),
                  ),
                  // testimonial
                  Flexible(
                    child: AutoSizeText(
                      testimonial.testimonial,
                      textScaleFactor: 1.2,
                      minFontSize: 8.0,
                      softWrap: true,
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
