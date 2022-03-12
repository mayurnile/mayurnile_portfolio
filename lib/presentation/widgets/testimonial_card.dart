import 'package:flutter/material.dart';

import '../../core/core.dart';

enum TestimonialCardType { mobile, tablet, desktop }

class TestimonialCard extends StatelessWidget {
  final String testimonial;
  final String givenBy;
  final String companyName;
  final double cardWidth;
  final bool showSwitch;
  final TestimonialCardType type;

  const TestimonialCard({
    Key? key,
    required this.testimonial,
    required this.givenBy,
    required this.companyName,
    required this.cardWidth,
    required this.type,
    this.showSwitch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isSmall = type == TestimonialCardType.mobile;

    return Column(
      children: [
        // testominal card
        Container(
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
                givenBy,
                style: isSmall ? textTheme.headline4!.copyWith(fontFamily: 'Josefin Sans') : textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
              ),
              // spacing
              const SizedBox(height: 4.0),
              // company name
              Text(
                companyName,
                style: isSmall
                    ? textTheme.subtitle1!.copyWith(
                        color: AppTheme.secondaryColor,
                        fontFamily: 'Victor Mono',
                        fontWeight: FontWeight.bold,
                      )
                    : textTheme.bodyText2!.copyWith(
                        color: AppTheme.secondaryColor,
                        fontFamily: 'Victor Mono',
                        fontWeight: FontWeight.bold,
                      ),
              ),
              // spacing
              const SizedBox(height: 14.0),
              // testimonial
              Text.rich(
                TextSpan(
                  text: "\" ",
                  style: isSmall
                      ? textTheme.headline3!.copyWith(
                          fontFamily: 'Nunito',
                          color: Colors.white54,
                          height: 0.7,
                        )
                      : textTheme.headline1!.copyWith(
                          fontFamily: 'Nunito',
                          color: Colors.white54,
                          height: 0.7,
                        ),
                  children: [
                    TextSpan(
                      text: testimonial,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: isSmall ? 12 : 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
