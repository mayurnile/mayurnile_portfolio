import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './widgets.dart';

import '../../core/core.dart';

class TestimonialCard extends StatelessWidget {
  final String testimonial;
  final String givenBy;
  final String companyName;
  final double cardWidth;
  final bool showSwitch;

  const TestimonialCard({
    Key? key,
    required this.testimonial,
    required this.givenBy,
    required this.companyName,
    required this.cardWidth,
    this.showSwitch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // testominal card
        Container(
          width: cardWidth,
          color: AppTheme.primaryColor,
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              // testimonial
              Text(
                testimonial,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // divider
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  color: AppTheme.backgroundColor,
                  indent: 20.0,
                  endIndent: 20.0,
                  thickness: 0.5,
                ),
              ),
              // testimonial given by
              Text(
                givenBy,
                style: textTheme.headline4!.copyWith(fontFamily: 'Josefin Sans'),
              ),
              // spacing
              const SizedBox(height: 4.0),
              // company name
              Text(
                companyName,
                style: textTheme.bodyText2!.copyWith(
                  color: AppTheme.fontDarkColor,
                  fontFamily: 'Victor Mono',
                ),
              ),
            ],
          ),
        ),
        // spacing
        if (showSwitch)
          SizedBox(
            height: size.height * 0.1,
          ),
        // action buttons
        if (showSwitch) _buildActionButtons(),
      ],
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildActionButtons() => Row(
        children: [
          // left arrow
          AppIconButton(
            isFilled: false,
            icon: SvgPicture.asset(IconAssets.arrowBack),
            onPressed: () {},
            color: AppTheme.secondaryColor,
          ),
          // spacing
          const SizedBox(width: 42.0),
          // right arrow
          AppIconButton(
            isFilled: true,
            icon: SvgPicture.asset(IconAssets.arrowForward),
            onPressed: () {},
            color: AppTheme.ternaryColor,
          ),
        ],
      );
}
