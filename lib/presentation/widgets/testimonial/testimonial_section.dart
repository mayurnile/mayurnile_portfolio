import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets.dart';

import '../../../core/core.dart';

class TestimonialSection extends StatefulWidget {
  final TestimonialCardType cardType;

  const TestimonialSection({
    super.key,
    required this.cardType,
  });

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  // control variables
  int frontIndex = 0;
  int backIndex = 1;
  bool isFront = true;
  bool isLast = false;
  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth * 0.35;
        double maxHeight = size.height * 0.3;

        switch (widget.cardType) {
          case TestimonialCardType.mobile:
            maxWidth = constraints.maxWidth * 0.8;
            maxHeight = size.height * 0.35;
            break;
          case TestimonialCardType.tablet:
            maxWidth = constraints.maxWidth * 0.6;
            maxHeight = size.height * 0.3;
            break;
          case TestimonialCardType.desktop:
            maxWidth = constraints.maxWidth * 0.35;
            maxHeight = size.height * 0.3;
            break;
        }

        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            children: [
              // testimonial
              FlipCard(
                controller: flipCardController,
                front: TestimonialCard(
                  testimonial: testimonialsList[frontIndex],
                  type: widget.cardType,
                  cardWidth: maxWidth,
                  cardHeight: maxHeight,
                ),
                back: TestimonialCard(
                  testimonial: testimonialsList[backIndex],
                  type: widget.cardType,
                  cardWidth: maxWidth,
                  cardHeight: maxHeight,
                ),
              ),

              // spacing
              SizedBox(height: size.height * 0.05),
              // testimonial actions
              _buildActionButtons(widget.cardType),
            ],
          ),
        );
      },
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildActionButtons(TestimonialCardType type) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // left arrow
          AppIconButton(
            isFilled: false,
            icon: SvgPicture.asset(IconAssets.arrowBack),
            onPressed: flipBackward,
            color: AppTheme.secondaryColor,
            isSmall: type != TestimonialCardType.desktop,
          ),
          //  desktop spacing
          if (type == TestimonialCardType.desktop) const SizedBox(width: 42.0),
          // other spacing
          if (type != TestimonialCardType.desktop) const SizedBox(width: 18.0),
          // right arrow
          AppIconButton(
            isFilled: true,
            icon: SvgPicture.asset(IconAssets.arrowForward),
            onPressed: flipForward,
            color: AppTheme.ternaryColor,
            isSmall: type != TestimonialCardType.desktop,
          ),
        ],
      );

  /// Member Functions
  ///
  ///
  Future flipForward() async {
    if (testimonialsList.length.isEven) {
      if (backIndex <= testimonialsList.length && isLast == false) {
        flipCardController.flipForward();
        Future.delayed(const Duration(milliseconds: 400)).then((_) => setState(() {
              isFront = !isFront;
              if (isFront) {
                if (!(backIndex + 1 > testimonialsList.length - 1)) {
                  frontIndex = backIndex + 1;
                }
                if (frontIndex + 1 == testimonialsList.length) {
                  backIndex = frontIndex;
                } else {
                  backIndex = frontIndex + 1;
                }
              }

              if (backIndex == testimonialsList.length - 1 && isFront == false) {
                isLast = true;
              } else {
                isLast = false;
              }
            }));
      }
    } else {
      if (frontIndex <= testimonialsList.length && isLast == false) {
        flipCardController.flipForward();
        Future.delayed(const Duration(milliseconds: 400)).then((_) => setState(() {
              isFront = !isFront;
              if (isFront) {
                if (!(backIndex + 1 > testimonialsList.length - 1)) {
                  frontIndex = backIndex + 1;
                }
                if (frontIndex + 1 == testimonialsList.length) {
                  backIndex = frontIndex;
                } else {
                  backIndex = frontIndex + 1;
                }
              }

              if (frontIndex == testimonialsList.length - 1 && isFront == true) {
                isLast = true;
              } else {
                isLast = false;
              }
            }));
      }
    }
  }

  Future flipBackward() async {
    if (testimonialsList.length.isEven) {
      if (isFront == false || frontIndex > 1) {
        if (isFront && frontIndex > 0) {
          if (frontIndex > 0) frontIndex -= 2;
          if (backIndex > 1) backIndex -= 2;
        }
        if (frontIndex >= 0) {
          flipCardController.flipBackward();
          Future.delayed(const Duration(milliseconds: 400)).then((value) => setState(() {
                isFront = !isFront;
                isLast = false;
              }));
        }
      }
    } else {
      if (isFront == false || frontIndex > 1) {
        if (isFront && frontIndex == testimonialsList.length - 1) {
          frontIndex -= 2;
          backIndex -= 1;
        } else if (isFront && frontIndex > 0) {
          if (frontIndex > 0) frontIndex -= 2;
          if (backIndex > 1) backIndex -= 2;
        }

        if (frontIndex >= 0) {
          flipCardController.flipBackward();
          Future.delayed(const Duration(milliseconds: 400)).then((value) => setState(() {
                isFront = !isFront;
                isLast = false;
              }));
        }
      }
    }
  }
}
